local M = {}

---@alias RGB { [1]: number, [2]: number, [3]: number }
---@alias HSL { [1]: number, [2]: number, [3]: number }

---@param message string
---@param level? "info"|"warn"|"error"
function M.notify(message, level)
    level = level or "info"
    local level_int = level == "info" and 2 or level == "warn" and 3 or 4
    vim.notify(message, level_int, { title = "plum.nvim" })
end

---@param hex string "#rrggbb"
---@return RGB
function M.hex_to_rgb(hex)
    return {
        tonumber(hex:sub(2, 3), 16),
        tonumber(hex:sub(4, 5), 16),
        tonumber(hex:sub(6, 7), 16),
    }
end

---@param rgb RGB
---@return string
function M.rgb_to_hex(rgb)
    return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
end

---@param HSL HSL  { h: 0-360, s: 0-100, l: 0-100 }
---@return RGB
function M.hsl_to_rgb(HSL)
    local h, s, l = HSL[1] / 360, HSL[2] / 100, HSL[3] / 100
    local r, g, b

    if s == 0 then
        r, g, b = l, l, l
    else
        local function hue2rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1 / 6 then return p + (q - p) * 6 * t end
            if t < 1 / 2 then return q end
            if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
            return p
        end
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        r = hue2rgb(p, q, h + 1 / 3)
        g = hue2rgb(p, q, h)
        b = hue2rgb(p, q, h - 1 / 3)
    end

    return { r * 255, g * 255, b * 255 }
end

---@param RGB RGB
---@return HSL
function M.rgb_to_hsl(RGB)
    local r, g, b = RGB[1] / 255, RGB[2] / 255, RGB[3] / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, l

    l = (max + min) / 2

    if max == min then
        h, s = 0, 0
    else
        local d = max - min
        s = l > 0.5 and d / (2 - max - min) or d / (max + min)
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        else
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    return { h * 360, s * 100, l * 100 }
end

---@param hex string
---@param weight number  0=fully desaturated, 1=original
---@return string
function M.desaturate_hex(hex, weight)
    local rgb = M.hex_to_rgb(hex)
    local hsl = M.rgb_to_hsl(rgb)
    hsl[2] = hsl[2] * weight
    local rgb2 = M.hsl_to_rgb(hsl)
    return string.format("#%02x%02x%02x", rgb2[1], rgb2[2], rgb2[3])
end

---@param colors table<string, string>
---@param weight number
---@return table<string, string>
function M.apply_saturation(colors, weight)
    if weight >= 1 then return colors end
    if weight < 0 then weight = 0 end
    local out = {}
    for k, v in pairs(colors) do
        out[k] = M.desaturate_hex(v, weight)
    end
    return out
end

---@param color1 string
---@param color2 string
---@param weight? number  1.0 = fully color1, 0.0 = fully color2
---@return string
function M.blend(color1, color2, weight)
    weight = weight or 0.5
    local c1 = M.hex_to_rgb(color1)
    local c2 = M.hex_to_rgb(color2)
    local out = {}
    for i = 1, 3 do
        out[i] = math.floor(c1[i] * weight + c2[i] * (1 - weight))
    end
    return string.format("#%02x%02x%02x", out[1], out[2], out[3])
end

---@param syntax table<string, table>
function M.syntax(syntax)
    for group, opts in pairs(syntax) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

---@param theme { highlights: table<string, table> }
---@param colors_name? string
function M.load(theme, colors_name)
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = colors_name or "plum"
    M.syntax(theme.highlights)
end

---@param template string
---@param t table<string, string>
---@return string
function M.parse_extra_template(template, t)
    for k, v in pairs(t) do
        template = template:gsub("%${" .. k .. "}", v)
    end
    return template
end

return M
