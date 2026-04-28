local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        GitSignsAdd             = { fg = t.green },
        GitSignsChange          = { fg = t.blue },
        GitSignsDelete          = { fg = t.red },
        GitSignsAddNr           = { fg = t.green },
        GitSignsChangeNr        = { fg = t.blue },
        GitSignsDeleteNr        = { fg = t.red },
        GitSignsAddLn           = { link = "DiffAdd" },
        GitSignsChangeLn        = { link = "DiffChange" },
        GitSignsDeleteLn        = { link = "DiffDelete" },
        GitSignsCurrentLineBlame = { fg = t.fg_subtle, italic = true },
        GitSignsAddInline       = { link = "DiffAdd" },
        GitSignsChangeInline    = { link = "DiffChange" },
        GitSignsDeleteInline    = { link = "DiffDelete" },
    }
end

return M
