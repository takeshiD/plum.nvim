local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    local hl = {
        TelescopeBorder         = { fg = t.border },
        TelescopePromptTitle    = { fg = t.pink,   bold = true },
        TelescopeResultsTitle   = { fg = t.cyan,   bold = true },
        TelescopePreviewTitle   = { fg = t.plum,   bold = true },
        TelescopePromptPrefix   = { fg = t.pink },
        TelescopePromptCounter  = { fg = t.fg_subtle },
        TelescopeMatching       = { fg = t.yellow, bold = true },
        TelescopeSelection      = { bg = t.selection },

        -- links
        TelescopeNormal                   = { link = "NormalFloat" },
        TelescopeSelectionCaret           = { link = "TelescopeSelection" },
        TelescopeMultiSelection           = { link = "Type" },
        TelescopeMultiIcon                = { fg = t.plum },
        TelescopePreviewNormal            = { link = "TelescopeNormal" },
        TelescopePromptNormal             = { link = "TelescopeNormal" },
        TelescopeResultsNormal            = { link = "TelescopeNormal" },
        TelescopePromptBorder             = { link = "TelescopeBorder" },
        TelescopeResultsBorder            = { link = "TelescopeBorder" },
        TelescopePreviewBorder            = { link = "TelescopeBorder" },
        TelescopeTitle                    = { link = "TelescopeBorder" },
        TelescopePreviewLine              = { link = "Visual" },
        TelescopePreviewMatch             = { link = "Search" },
        TelescopePreviewDirectory         = { link = "Directory" },
        TelescopePreviewLink              = { link = "Special" },
        TelescopeResultsClass             = { link = "Type" },
        TelescopeResultsConstant          = { link = "Constant" },
        TelescopeResultsField             = { link = "@variable.member" },
        TelescopeResultsFunction          = { link = "Function" },
        TelescopeResultsMethod            = { link = "@method" },
        TelescopeResultsOperator          = { link = "Operator" },
        TelescopeResultsNumber            = { link = "Number" },
        TelescopeResultsComment           = { link = "Comment" },
        TelescopeResultsLineNr            = { link = "LineNr" },
        TelescopeResultsIdentifier        = { link = "Identifier" },
        TelescopeResultsDiffAdd           = { link = "DiffAdd" },
        TelescopeResultsDiffChange        = { link = "DiffChange" },
        TelescopeResultsDiffDelete        = { link = "DiffDelete" },
        TelescopeResultsDiffUntracked     = { link = "NonText" },
    }

    if opts.borderless_pickers then
        hl.TelescopeBorder        = { fg = t.bg_alt, bg = t.bg_alt }
        hl.TelescopeNormal        = { bg = t.bg_alt }
        hl.TelescopePreviewBorder = { fg = t.bg_alt, bg = t.bg_alt }
        hl.TelescopePreviewNormal = { bg = t.bg_alt }
        hl.TelescopePreviewTitle  = { fg = t.bg_alt, bg = t.plum,  bold = true }
        hl.TelescopeResultsBorder = { fg = t.bg_alt, bg = t.bg_alt }
        hl.TelescopeResultsNormal = { bg = t.bg_alt }
        hl.TelescopePromptBorder  = { fg = t.bg_alt, bg = t.bg_alt }
        hl.TelescopePromptNormal  = { bg = t.bg_alt }
        hl.TelescopePromptPrefix  = { fg = t.pink,   bg = t.bg_alt }
        hl.TelescopePromptCounter = { fg = t.fg_subtle, bg = t.bg_alt }
        hl.TelescopePromptTitle   = { fg = t.bg_alt, bg = t.pink,  bold = true }
        hl.TelescopeResultsTitle  = { fg = t.bg_alt, bg = t.cyan,  bold = true }
    end

    return hl
end

return M
