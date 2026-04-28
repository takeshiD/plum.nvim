local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    return {
        LazyH1              = { fg = t.pink,   bold = true },
        LazyH2              = { fg = t.plum,   bold = true },
        LazyButton          = { fg = t.fg,     bg = t.bg_alt },
        LazyButtonActive    = { fg = t.bg,     bg = t.pink,    bold = true },
        LazySpecial         = { fg = t.cyan },
        LazyReasonPlugin    = { fg = t.plum },
        LazyReasonEvent     = { fg = t.yellow },
        LazyReasonKeys      = { fg = t.green },
        LazyReasonCmd       = { fg = t.orange },
        LazyReasonFt        = { fg = t.blue },
        LazyReasonImport    = { fg = t.jade },
        LazyReasonRuntime   = { fg = t.purple },
        LazyReasonSource    = { fg = t.cyan },
        LazyReasonRequire   = { fg = t.pink_bright },
        LazyReasonStart     = { fg = t.fg_subtle },
        LazyProgressDone    = { fg = t.green,  bold = true },
        LazyProgressTodo    = { fg = t.fg_subtle },
        LazyProp            = { fg = t.fg_muted },
        LazyValue           = { fg = t.cyan },
        LazyNoCond          = { fg = t.orange },
        LazyDimmed          = { fg = t.fg_subtle },
        LazyComment         = { link = "Comment" },
        LazyCommit          = { fg = t.green },
        LazyCommitIssue     = { fg = t.orange },
        LazyCommitType      = { fg = t.blue },
        LazyCommitScope     = { fg = t.cyan },
        LazyUrl             = { fg = t.blue, underline = true },
    }
end

return M
