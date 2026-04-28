local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        WhichKey            = { fg = t.pink },
        WhichKeyGroup       = { fg = t.plum,     bold = true },
        WhichKeyDesc        = { fg = t.fg },
        WhichKeySeparator   = { fg = t.fg_subtle },
        WhichKeyValue       = { fg = t.fg_muted },
        WhichKeyBorder      = { link = "FloatBorder" },
        WhichKeyNormal      = { link = "NormalFloat" },
        WhichKeyTitle       = { fg = t.pink,     bold = true },
        WhichKeyIcon        = { fg = t.plum },
        WhichKeyIconAzure   = { fg = t.blue },
        WhichKeyIconBlue    = { fg = t.blue },
        WhichKeyIconCyan    = { fg = t.cyan },
        WhichKeyIconGreen   = { fg = t.green },
        WhichKeyIconGrey    = { fg = t.fg_subtle },
        WhichKeyIconOrange  = { fg = t.orange },
        WhichKeyIconPurple  = { fg = t.purple },
        WhichKeyIconRed     = { fg = t.red },
        WhichKeyIconYellow  = { fg = t.yellow },
    }
end

return M
