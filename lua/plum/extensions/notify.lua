local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        NotifyBackground    = { bg = t.bg_float },
        NotifyERRORBorder   = { fg = t.red },
        NotifyWARNBorder    = { fg = t.orange },
        NotifyINFOBorder    = { fg = t.cyan },
        NotifyDEBUGBorder   = { fg = t.fg_subtle },
        NotifyTRACEBorder   = { fg = t.purple },
        NotifyERRORIcon     = { fg = t.red },
        NotifyWARNIcon      = { fg = t.orange },
        NotifyINFOIcon      = { fg = t.cyan },
        NotifyDEBUGIcon     = { fg = t.fg_subtle },
        NotifyTRACEIcon     = { fg = t.purple },
        NotifyERRORTitle    = { fg = t.red,       bold = true },
        NotifyWARNTitle     = { fg = t.orange,    bold = true },
        NotifyINFOTitle     = { fg = t.cyan,      bold = true },
        NotifyDEBUGTitle    = { fg = t.fg_subtle, bold = true },
        NotifyTRACETitle    = { fg = t.purple,    bold = true },
        NotifyERRORBody     = { link = "NormalFloat" },
        NotifyWARNBody      = { link = "NormalFloat" },
        NotifyINFOBody      = { link = "NormalFloat" },
        NotifyDEBUGBody     = { link = "NormalFloat" },
        NotifyTRACEBody     = { link = "NormalFloat" },
    }
end

return M
