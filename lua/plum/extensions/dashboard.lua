local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        -- dashboard.nvim
        DashboardHeader         = { fg = t.pink },
        DashboardFooter         = { fg = t.fg_subtle, italic = true },
        DashboardDesc           = { fg = t.fg },
        DashboardKey            = { fg = t.yellow,    bold = true },
        DashboardIcon           = { fg = t.plum },
        DashboardShortCut       = { fg = t.cyan },
        DashboardProjectTitle   = { fg = t.plum,      bold = true },
        DashboardProjectTitleIcon = { fg = t.plum },
        DashboardProjectIcon    = { fg = t.blue },
        DashboardMruTitle       = { fg = t.plum,      bold = true },
        DashboardMruIcon        = { fg = t.plum },
        DashboardFiles          = { fg = t.fg },
        DashboardSectionTitle   = { fg = t.pink,      bold = true },

        -- alpha.nvim
        AlphaHeader             = { fg = t.pink },
        AlphaFooter             = { fg = t.fg_subtle, italic = true },
        AlphaButtons            = { fg = t.cyan },
        AlphaShortcut           = { fg = t.yellow,    bold = true },
    }
end

return M
