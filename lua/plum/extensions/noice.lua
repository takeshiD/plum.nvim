local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        NoiceCmdline            = { fg = t.fg,       bg = t.bg_float },
        NoiceCmdlineIcon        = { fg = t.pink },
        NoiceCmdlineIconSearch  = { fg = t.yellow },
        NoiceCmdlinePopup       = { fg = t.fg,       bg = t.bg_float },
        NoiceCmdlinePopupBorder = { fg = t.border },
        NoiceCmdlinePopupTitle  = { fg = t.pink,     bold = true },
        NoiceCmdlinePrompt      = { fg = t.cyan },

        NoiceConfirm            = { link = "NormalFloat" },
        NoiceConfirmBorder      = { link = "FloatBorder" },

        NoiceFormatConfirm      = { fg = t.bg, bg = t.pink,    bold = true },
        NoiceFormatConfirmDefault = { fg = t.bg, bg = t.green, bold = true },

        NoiceLspProgressClient  = { fg = t.plum },
        NoiceLspProgressSpinner = { fg = t.cyan },
        NoiceLspProgressTitle   = { fg = t.fg_muted },

        NoiceMini               = { fg = t.fg,       bg = t.bg_float },

        NoicePopup              = { link = "NormalFloat" },
        NoicePopupBorder        = { link = "FloatBorder" },

        NoiceScrollbar          = { bg = t.bg_alt },
        NoiceScrollbarThumb     = { bg = t.border },

        NoiceSplit              = { link = "Normal" },
        NoiceSplitBorder        = { link = "FloatBorder" },

        NoiceVirtualText        = { fg = t.fg_subtle, italic = true },

        -- Notify levels via noice
        NoiceAttr_0             = { link = "Normal" },
        NoiceAttr_1             = { fg = t.red },
        NoiceAttr_2             = { fg = t.orange },
        NoiceAttr_3             = { fg = t.cyan },
        NoiceAttr_4             = { fg = t.jade },
        NoiceAttr_5             = { fg = t.fg_subtle },
    }
end

return M
