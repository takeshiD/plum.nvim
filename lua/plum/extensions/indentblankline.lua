local util = require("plum.util")
local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    local indent_fg = util.blend(t.bg_solid, t.fg_subtle, 0.7)
    return {
        -- indent-blankline v3 (ibl)
        IblIndent               = { fg = indent_fg,  nocombine = true },
        IblScope                = { fg = t.border,   nocombine = true },
        IblWhitespace           = { fg = indent_fg,  nocombine = true },

        -- indent-blankline v2 (legacy)
        IndentBlanklineChar             = { fg = indent_fg,  nocombine = true },
        IndentBlanklineSpaceChar        = { fg = indent_fg,  nocombine = true },
        IndentBlanklineSpaceCharBlankline = { fg = indent_fg, nocombine = true },
        IndentBlanklineContextChar      = { fg = t.border,   nocombine = true },
        IndentBlanklineContextStart     = { sp = t.border,   underline = true },
        IndentBlanklineIndent1          = { fg = util.blend(t.bg_solid, t.pink,   0.85), nocombine = true },
        IndentBlanklineIndent2          = { fg = util.blend(t.bg_solid, t.plum,   0.85), nocombine = true },
        IndentBlanklineIndent3          = { fg = util.blend(t.bg_solid, t.purple, 0.85), nocombine = true },
        IndentBlanklineIndent4          = { fg = util.blend(t.bg_solid, t.blue,   0.85), nocombine = true },
        IndentBlanklineIndent5          = { fg = util.blend(t.bg_solid, t.cyan,   0.85), nocombine = true },
        IndentBlanklineIndent6          = { fg = util.blend(t.bg_solid, t.green,  0.85), nocombine = true },
    }
end

return M
