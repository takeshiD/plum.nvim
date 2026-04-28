local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        CmpItemAbbr             = { fg = t.fg },
        CmpItemAbbrDeprecated   = { fg = t.fg_subtle, strikethrough = true },
        CmpItemAbbrMatch        = { fg = t.yellow, bold = true },
        CmpItemAbbrMatchFuzzy   = { fg = t.orange, bold = true },
        CmpItemMenu             = { fg = t.fg_subtle, italic = true },

        CmpItemKindText         = { fg = t.fg },
        CmpItemKindMethod       = { fg = t.blue },
        CmpItemKindFunction     = { fg = t.cyan },
        CmpItemKindConstructor  = { fg = t.purple },
        CmpItemKindField        = { fg = t.plum },
        CmpItemKindVariable     = { fg = t.fg },
        CmpItemKindClass        = { fg = t.purple },
        CmpItemKindInterface    = { fg = t.purple },
        CmpItemKindModule       = { fg = t.pink_bright },
        CmpItemKindProperty     = { fg = t.plum },
        CmpItemKindUnit         = { fg = t.orange },
        CmpItemKindValue        = { fg = t.green },
        CmpItemKindEnum         = { fg = t.purple },
        CmpItemKindKeyword      = { fg = t.pink },
        CmpItemKindSnippet      = { fg = t.jade },
        CmpItemKindColor        = { fg = t.pink },
        CmpItemKindFile         = { fg = t.blue },
        CmpItemKindReference    = { fg = t.cyan },
        CmpItemKindFolder       = { fg = t.blue },
        CmpItemKindEnumMember   = { fg = t.pink_bright },
        CmpItemKindConstant     = { fg = t.pink_bright },
        CmpItemKindStruct       = { fg = t.purple },
        CmpItemKindEvent        = { fg = t.orange },
        CmpItemKindOperator     = { fg = t.fg_muted },
        CmpItemKindTypeParameter = { fg = t.purple },

        CmpDocumentation        = { link = "NormalFloat" },
        CmpDocumentationBorder  = { link = "FloatBorder" },
    }
end

return M
