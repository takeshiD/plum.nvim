local util = require("plum.util")
local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    local hl = {
        -- ── Editor UI ───────────────────────────────────────────────────────
        Normal          = { fg = t.fg,        bg = t.bg },
        NormalNC        = { fg = t.fg,        bg = t.bg },
        NormalFloat     = { fg = t.fg,        bg = t.bg_float },
        FloatBorder     = { fg = t.border,    bg = t.bg_float },
        FloatTitle      = { fg = t.pink,      bg = t.bg_float },

        ColorColumn     = { bg = t.selection },
        Conceal         = { fg = t.fg_subtle },
        Cursor          = { fg = t.bg,        bg = t.fg },
        ICursor         = { fg = t.bg,        bg = t.fg },
        CursorIM        = { fg = t.bg,        bg = t.fg },
        CursorColumn    = { bg = t.cursorline },
        CursorLine      = { bg = t.cursorline },
        CursorLineNr    = { fg = t.pink,      bold = true },

        Directory       = { fg = t.blue },
        EndOfBuffer     = { fg = util.blend(t.bg_float, t.fg_subtle, 0.6) },
        ErrorMsg        = { fg = t.red,       bold = true },

        VertSplit       = { fg = t.border,    bg = t.bg },
        WinSeparator    = { fg = t.border,    bg = t.bg },

        Folded          = { fg = t.fg_subtle, bg = t.bg_alt },
        FoldColumn      = { fg = t.fg_subtle, bg = t.bg },
        SignColumn      = { fg = t.fg_subtle, bg = t.bg },
        SignColumnSB    = { fg = t.fg_subtle, bg = t.bg },

        LineNr          = { fg = util.blend(t.bg_float, t.fg_subtle, 0.5) },
        MatchParen      = { fg = t.pink_bright, bold = true, underline = true },
        ModeMsg         = { fg = t.fg },
        MsgArea         = { fg = t.fg },
        MoreMsg         = { fg = t.cyan },
        NonText         = { fg = util.blend(t.bg_solid, t.fg_subtle, 0.4) },

        Pmenu           = { fg = t.fg,        bg = t.bg_float },
        PmenuSel        = { fg = t.fg,        bg = t.selection,  bold = true },
        PmenuSbar       = { bg = t.bg_alt },
        PmenuThumb      = { bg = t.border },
        PmenuMatch      = { fg = t.cyan,      bg = t.bg_float },
        PmenuMatchSel   = { fg = t.cyan,      bg = t.selection, bold = true },

        Question        = { fg = t.yellow },
        QuickFixLine    = { bg = t.selection },

        Search          = { fg = t.bg,        bg = t.yellow,    bold = true },
        IncSearch       = { fg = t.bg,        bg = t.orange,    bold = true },
        CurSearch       = { fg = t.bg,        bg = t.pink,      bold = true },
        Substitute      = { fg = t.bg,        bg = t.red },

        SpecialKey      = { fg = t.fg_subtle },

        SpellBad        = { sp = t.red,       undercurl = true },
        SpellCap        = { sp = t.yellow,    undercurl = true },
        SpellLocal      = { sp = t.blue,      undercurl = true },
        SpellRare       = { sp = t.purple,    undercurl = true },

        StatusLine      = { fg = t.yellow,        bg = t.bg_alt },
        StatusLineNC    = { fg = t.fg_subtle, bg = t.bg_alt },

        TabLine         = { fg = t.fg_subtle, bg = t.bg_alt },
        TabLineFill     = { fg = t.fg_subtle, bg = t.bg },
        TabLineSel      = { fg = t.fg,        bg = t.bg_float,  bold = true },

        WinBar          = { fg = t.fg,        bg = t.bg },
        WinBarNC        = { fg = t.fg_subtle, bg = t.bg },

        Title           = { fg = t.pink,      bold = true },

        Visual          = { bg = t.selection },
        VisualNOS       = { bg = t.selection },

        WarningMsg      = { fg = t.orange },
        Whitespace      = { fg = util.blend(t.bg_solid, t.fg_subtle, 0.3) },
        WildMenu        = { fg = t.bg,        bg = t.blue },

        -- ── Diff ──────────────────────────────────────────────────────────
        DiffAdd         = { bg = util.blend(t.bg_solid, t.green,  0.82) },
        DiffChange      = { bg = util.blend(t.bg_solid, t.blue,   0.82) },
        DiffDelete      = { bg = util.blend(t.bg_solid, t.red,    0.82) },
        DiffText        = { bg = util.blend(t.bg_solid, t.orange, 0.75) },
        Added           = { fg = t.green },
        Removed         = { fg = t.red },
        Changed         = { fg = t.blue },

        -- ── Syntax (classic groups) ────────────────────────────────────────
        Comment         = { fg = t.comment, italic = opts.italic_comments },

        Constant        = { fg = t.pink_bright },
        String          = { fg = t.green },
        Character       = { fg = t.green },
        Number          = { fg = t.orange },
        Float           = { fg = t.orange },
        Boolean         = { fg = t.yellow },

        Identifier      = { fg = t.fg },
        Function        = { fg = t.cyan },

        Statement       = { fg = t.pink },
        Conditional     = { fg = t.pink },
        Repeat          = { fg = t.pink },
        Label           = { fg = t.orange },
        Operator        = { fg = t.fg_muted },
        Keyword         = { fg = t.pink },
        Exception       = { fg = t.red },

        PreProc         = { fg = t.jade },
        Include         = { fg = t.jade },
        Define          = { fg = t.jade },
        Macro           = { fg = t.jade },
        PreCondit       = { fg = t.jade },

        Type            = { fg = t.purple },
        StorageClass    = { fg = t.purple },
        Structure       = { fg = t.purple },
        Typedef         = { fg = t.purple },

        Special         = { fg = t.pink_bright },
        SpecialChar     = { fg = t.pink_bright },
        Tag             = { fg = t.pink },
        Delimiter       = { fg = t.fg_muted },
        SpecialComment  = { fg = t.cyan, italic = true },
        Debug           = { fg = t.orange },

        Underlined      = { underline = true },
        Bold            = { bold = true },
        Italic          = { italic = true },

        Error           = { fg = t.red },
        Todo            = { fg = t.yellow, bold = true },

        -- ── LSP ───────────────────────────────────────────────────────────
        LspReferenceText  = { bg = util.blend(t.bg_solid, t.fg_subtle, 0.7) },
        LspReferenceRead  = { bg = util.blend(t.bg_solid, t.fg_subtle, 0.7) },
        LspReferenceWrite = { bg = util.blend(t.bg_solid, t.pink,      0.85) },
        LspCodeLens       = { fg = t.fg_subtle, italic = true },
        LspInlayHint      = { fg = t.fg_subtle, italic = true },
        LspInfoBorder     = { fg = t.border },
        LspSignatureActiveParameter = { fg = t.orange, bold = true },

        -- ── Diagnostics ───────────────────────────────────────────────────
        DiagnosticError             = { fg = t.red },
        DiagnosticWarn              = { fg = t.orange },
        DiagnosticInfo              = { fg = t.cyan },
        DiagnosticHint              = { fg = t.jade },
        DiagnosticUnnecessary       = { fg = t.fg_subtle },

        DiagnosticVirtualTextError  = { fg = t.red,    bg = util.blend(t.bg_solid, t.red,    0.88), italic = true },
        DiagnosticVirtualTextWarn   = { fg = t.orange, bg = util.blend(t.bg_solid, t.orange, 0.88), italic = true },
        DiagnosticVirtualTextInfo   = { fg = t.cyan,   bg = util.blend(t.bg_solid, t.cyan,   0.88), italic = true },
        DiagnosticVirtualTextHint   = { fg = t.jade,   bg = util.blend(t.bg_solid, t.jade,   0.88), italic = true },

        DiagnosticUnderlineError    = { undercurl = true, sp = t.red },
        DiagnosticUnderlineWarn     = { undercurl = true, sp = t.orange },
        DiagnosticUnderlineInfo     = { undercurl = true, sp = t.cyan },
        DiagnosticUnderlineHint     = { undercurl = true, sp = t.jade },

        -- ── QuickFix / Location list ───────────────────────────────────────
        qfLineNr    = { fg = t.fg_subtle },
        qfFileName  = { fg = t.blue },

        -- ── Markdown (built-in) ────────────────────────────────────────────
        markdownH1                  = { fg = t.pink,   bold = true },
        markdownH2                  = { fg = t.plum,   bold = true },
        markdownH3                  = { fg = t.purple, bold = true },
        markdownH4                  = { fg = t.blue,   bold = true },
        markdownH5                  = { fg = t.cyan,   bold = true },
        markdownH6                  = { fg = t.green,  bold = true },
        markdownCode                = { fg = t.cyan },
        markdownCodeBlock           = { fg = t.cyan },
        markdownLinkText            = { fg = t.blue, underline = true },
        markdownHeadingDelimiter    = { fg = t.fg_subtle },
        mkdCodeDelimiter            = { fg = t.fg_subtle },
        mkdCodeStart                = { fg = t.blue },
        mkdCodeEnd                  = { fg = t.blue },
    }

    return hl
end

return M
