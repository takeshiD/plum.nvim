local util = require("plum.util")
local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        -- mini.statusline
        MiniStatuslineModeNormal  = { fg = t.bg, bg = t.pink,   bold = true },
        MiniStatuslineModeInsert  = { fg = t.bg, bg = t.green,  bold = true },
        MiniStatuslineModeVisual  = { fg = t.bg, bg = t.plum,   bold = true },
        MiniStatuslineModeReplace = { fg = t.bg, bg = t.red,    bold = true },
        MiniStatuslineModeCommand = { fg = t.bg, bg = t.yellow, bold = true },
        MiniStatuslineModeOther   = { fg = t.bg, bg = t.cyan,   bold = true },
        MiniStatuslineDevinfo     = { fg = t.fg_muted, bg = t.bg_alt },
        MiniStatuslineFilename    = { fg = t.fg,       bg = t.bg_float },
        MiniStatuslineFileinfo    = { fg = t.fg_muted, bg = t.bg_alt },
        MiniStatuslineInactive    = { fg = t.fg_subtle, bg = t.bg_alt },

        -- mini.tabline
        MiniTablineCurrent        = { fg = t.fg,       bg = t.bg_float,  bold = true },
        MiniTablineVisible        = { fg = t.fg_muted, bg = t.bg_alt },
        MiniTablineHidden         = { fg = t.fg_subtle, bg = t.bg },
        MiniTablineModifiedCurrent = { fg = t.pink,    bg = t.bg_float,  bold = true },
        MiniTablineModifiedVisible = { fg = t.plum,    bg = t.bg_alt },
        MiniTablineModifiedHidden  = { fg = t.fg_subtle, bg = t.bg },
        MiniTablineFill           = { bg = t.bg },
        MiniTablineTabpagesection = { fg = t.bg, bg = t.plum, bold = true },

        -- mini.completion
        MiniCompletionActiveParameter = { fg = t.orange, bold = true },

        -- mini.cursorword
        MiniCursorword            = { underline = true },
        MiniCursorwordCurrent     = { underline = true },

        -- mini.indentscope
        MiniIndentscopeSymbol     = { fg = t.border },
        MiniIndentscopePrefix     = { nocombine = true },

        -- mini.jump
        MiniJump                  = { fg = t.bg, bg = t.pink, bold = true },
        MiniJump2dSpot            = { fg = t.yellow, bold = true, nocombine = true },
        MiniJump2dSpotAhead       = { fg = t.orange, nocombine = true },
        MiniJump2dSpotUnique      = { fg = t.pink,   bold = true, nocombine = true },
        MiniJump2dDim             = { fg = t.fg_subtle },

        -- mini.files
        MiniFilesBorder           = { link = "FloatBorder" },
        MiniFilesBorderModified   = { fg = t.orange },
        MiniFilesCursorLine       = { bg = t.selection },
        MiniFilesDirectory        = { fg = t.blue },
        MiniFilesFile             = { fg = t.fg },
        MiniFilesNormal           = { link = "NormalFloat" },
        MiniFilesTitle            = { fg = t.pink, bold = true },
        MiniFilesTitleFocused     = { fg = t.pink_bright, bold = true },

        -- mini.diff
        MiniDiffSignAdd           = { fg = t.green },
        MiniDiffSignChange        = { fg = t.blue },
        MiniDiffSignDelete        = { fg = t.red },
        MiniDiffOverAdd           = { bg = util.blend(t.bg_solid, t.green, 0.82) },
        MiniDiffOverChange        = { bg = util.blend(t.bg_solid, t.blue,  0.82) },
        MiniDiffOverDelete        = { bg = util.blend(t.bg_solid, t.red,   0.82) },
        MiniDiffOverContext       = { bg = t.bg_alt },

        -- mini.notify
        MiniNotifyBorder          = { link = "FloatBorder" },
        MiniNotifyNormal          = { link = "NormalFloat" },
        MiniNotifyTitle           = { fg = t.pink, bold = true },

        -- mini.pick
        MiniPickBorder            = { link = "FloatBorder" },
        MiniPickBorderBusy        = { fg = t.orange },
        MiniPickBorderText        = { fg = t.pink },
        MiniPickIconDirectory     = { fg = t.blue },
        MiniPickIconFile          = { fg = t.fg },
        MiniPickHeader            = { fg = t.plum, bold = true },
        MiniPickMatchCurrent      = { bg = t.selection },
        MiniPickMatchMarked       = { fg = t.yellow },
        MiniPickMatchRanges       = { fg = t.yellow, bold = true },
        MiniPickNormal            = { link = "NormalFloat" },
        MiniPickPreviewLine       = { link = "Visual" },
        MiniPickPreviewTitle      = { fg = t.cyan, bold = true },
        MiniPickPromptCaret       = { fg = t.pink },
        MiniPickPromptPrefix      = { fg = t.plum },

        -- mini.surround
        MiniSurround              = { fg = t.bg, bg = t.orange },

        -- mini.hipatterns
        MiniHipatternsTodo        = { fg = t.bg, bg = t.yellow, bold = true },
        MiniHipatternsHack        = { fg = t.bg, bg = t.red,    bold = true },
        MiniHipatternsFixme       = { fg = t.bg, bg = t.orange, bold = true },
        MiniHipatternsNote        = { fg = t.bg, bg = t.cyan,   bold = true },

        -- mini.clue
        MiniClueBorder            = { link = "FloatBorder" },
        MiniClueDescGroup         = { fg = t.plum, bold = true },
        MiniClueDescSingle        = { fg = t.fg },
        MiniClueNextKey           = { fg = t.pink_bright, bold = true },
        MiniClueNextKeyWithPostkeys = { fg = t.yellow },
        MiniClueSeparator         = { fg = t.fg_subtle },
        MiniClueTitle             = { fg = t.pink, bold = true },
    }
end

return M
