local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    local bg = opts.transparent and "NONE" or t.bg
    return {
        NeoTreeNormal               = { fg = t.fg,         bg = bg },
        NeoTreeNormalNC             = { link = "NeoTreeNormal" },
        NeoTreeEndOfBuffer          = { fg = t.bg_alt,     bg = bg },
        NeoTreeVertSplit            = { fg = t.border,     bg = bg },
        NeoTreeWinSeparator         = { fg = t.border,     bg = bg },
        NeoTreeStatusLine           = { fg = t.fg_subtle,  bg = t.bg_alt },
        NeoTreeStatusLineNC         = { fg = t.fg_subtle,  bg = t.bg_alt },

        NeoTreeIndentMarker         = { fg = t.bg_float },
        NeoTreeExpander             = { fg = t.fg_subtle },

        NeoTreeRootName             = { fg = t.pink,       bold = true },
        NeoTreeDirectoryName        = { fg = t.blue },
        NeoTreeDirectoryIcon        = { fg = t.blue },
        NeoTreeDotfile              = { fg = t.fg_subtle },
        NeoTreeHiddenByName         = { fg = t.fg_subtle },
        NeoTreeSymbolicLinkTarget   = { fg = t.cyan },
        NeoTreeFileName             = { fg = t.fg },
        NeoTreeFileNameOpened       = { fg = t.pink_bright, bold = true },
        NeoTreeFileIcon             = { fg = t.fg_muted },
        NeoTreeDimText              = { link = "Conceal" },

        -- git status
        NeoTreeGitAdded             = { fg = t.green },
        NeoTreeGitModified          = { fg = t.blue },
        NeoTreeGitDeleted           = { fg = t.red },
        NeoTreeGitConflict          = { fg = t.orange,    italic = true },
        NeoTreeGitIgnored           = { fg = t.fg_subtle },
        NeoTreeGitUnstaged          = { fg = t.yellow },
        NeoTreeGitUntracked         = { fg = t.plum },
        NeoTreeGitStaged            = { fg = t.green },
        NeoTreeGitRenamed           = { fg = t.cyan },

        -- floating windows
        NeoTreeFloatBorder          = { link = "FloatBorder" },
        NeoTreeFloatTitle           = { fg = t.pink,      bold = true },
        NeoTreeTitleBar             = { fg = t.bg,        bg = t.pink },

        -- filter / search
        NeoTreeFilterTerm           = { fg = t.yellow,    bold = true },

        -- tabs
        NeoTreeTabActive            = { fg = t.fg,        bg = t.bg_float,  bold = true },
        NeoTreeTabInactive          = { fg = t.fg_subtle, bg = t.bg_alt },
        NeoTreeTabSeparatorActive   = { fg = t.pink,      bg = t.bg_float },
        NeoTreeTabSeparatorInactive = { fg = t.bg_alt,    bg = t.bg_alt },

        -- messages / prompts
        NeoTreeMessage              = { fg = t.fg_subtle, italic = true },
        NeoTreeModified             = { fg = t.orange },
        NeoTreeCursorLine           = { bg = t.cursorline },
    }
end

return M
