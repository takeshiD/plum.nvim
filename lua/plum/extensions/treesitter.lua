local util = require("plum.util")
local M = {}

---@param opts plum.Config
---@param t plum.Palette
---@return table<string, table>
function M.get(opts, t)
    opts = opts or {}
    local hl = {
        -- ── Literals ──────────────────────────────────────────────────────
        ["@string"]                         = { link = "String" },
        ["@string.escape"]                  = { fg = t.pink_bright },
        ["@string.regex"]                   = { fg = t.orange },
        ["@string.special"]                 = { fg = t.pink_bright },
        ["@string.documentation"]           = { link = "Comment" },
        ["@character"]                      = { link = "Character" },
        ["@character.special"]              = { link = "SpecialChar" },
        ["@number"]                         = { link = "Number" },
        ["@number.float"]                   = { link = "Float" },
        ["@float"]                          = { link = "Float" },
        ["@boolean"]                        = { link = "Boolean" },

        -- ── Variables & Parameters ────────────────────────────────────────
        ["@variable"]                       = { fg = t.fg },
        ["@variable.builtin"]               = { fg = t.pink,   italic = true },
        ["@variable.parameter"]             = { fg = t.orange },
        ["@variable.member"]                = { fg = t.plum },   -- field/property
        ["@field"]                          = { fg = t.plum },
        ["@property"]                       = { fg = t.plum },

        -- ── Functions ─────────────────────────────────────────────────────
        ["@function"]                       = { link = "Function" },
        ["@function.builtin"]               = { fg = t.cyan, italic = true },
        ["@function.call"]                  = { link = "@function" },
        ["@function.macro"]                 = { fg = t.jade },
        ["@function.method"]                = { fg = t.blue },
        ["@function.method.call"]           = { fg = t.blue },
        ["@method"]                         = { fg = t.blue },
        ["@method.call"]                    = { fg = t.blue },
        ["@constructor"]                    = { fg = t.purple },

        -- ── Keywords ──────────────────────────────────────────────────────
        ["@keyword"]                        = { link = "Keyword" },
        ["@keyword.function"]               = { fg = t.pink },
        ["@keyword.operator"]               = { fg = t.fg_muted },
        ["@keyword.return"]                 = { fg = t.pink, italic = true },
        ["@keyword.coroutine"]              = { fg = t.pink },
        ["@keyword.import"]                 = { fg = t.jade },
        ["@keyword.type"]                   = { fg = t.purple, italic = true },
        ["@keyword.modifier"]               = { fg = t.purple },
        ["@keyword.repeat"]                 = { link = "Repeat" },
        ["@keyword.conditional"]            = { link = "Conditional" },
        ["@keyword.conditional.ternary"]    = { fg = t.fg_muted },
        ["@keyword.exception"]              = { fg = t.red },
        ["@keyword.debug"]                  = { fg = t.orange },

        -- ── Types ─────────────────────────────────────────────────────────
        ["@type"]                           = { link = "Type" },
        ["@type.builtin"]                   = { fg = util.blend(t.purple, t.cyan, 0.6) },
        ["@type.definition"]                = { link = "Typedef" },
        ["@type.qualifier"]                 = { fg = t.purple, italic = true },

        -- ── Namespaces & Modules ───────────────────────────────────────────
        -- ["@module"]                         = { fg = t.pink_bright },
        ["@module"]                         = { fg = t.orange },
        ["@module.builtin"]                 = { fg = t.yellow, italic = true },
        ["@namespace"]                      = { link = "Include" },
        ["@label"]                          = { link = "Label" },

        -- ── Operators & Punctuation ────────────────────────────────────────
        ["@operator"]                       = { link = "Operator" },
        ["@punctuation.bracket"]            = { fg = t.fg_muted },
        ["@punctuation.delimiter"]          = { fg = t.fg_subtle },
        ["@punctuation.special"]            = { fg = t.pink_bright },

        -- ── Comments ──────────────────────────────────────────────────────
        ["@comment"]                        = { link = "Comment" },
        ["@comment.documentation"]          = { fg = t.comment, italic = true },
        ["@comment.error"]                  = { fg = t.red,    bold = true },
        ["@comment.warning"]                = { fg = t.orange, bold = true },
        ["@comment.todo"]                   = { fg = t.yellow, bold = true },
        ["@comment.note"]                   = { fg = t.cyan,   bold = true },

        -- ── Tags (HTML/XML/JSX) ────────────────────────────────────────────
        ["@tag"]                            = { fg = t.pink },
        ["@tag.builtin"]                    = { fg = t.pink, italic = true },
        ["@tag.attribute"]                  = { fg = t.plum },
        ["@tag.delimiter"]                  = { fg = t.fg_subtle },

        -- ── Markup (Markdown etc.) ─────────────────────────────────────────
        ["@markup.heading.1"]               = { fg = t.pink,   bold = true },
        ["@markup.heading.2"]               = { fg = t.plum,   bold = true },
        ["@markup.heading.3"]               = { fg = t.purple, bold = true },
        ["@markup.heading.4"]               = { fg = t.blue,   bold = true },
        ["@markup.heading.5"]               = { fg = t.cyan,   bold = true },
        ["@markup.heading.6"]               = { fg = t.green,  bold = true },
        ["@markup.heading.marker"]          = { fg = t.fg_subtle },
        ["@markup.strong"]                  = { fg = t.pink_bright, bold = true },
        ["@markup.italic"]                  = { fg = t.blue, italic = true },
        ["@markup.strikethrough"]           = { fg = t.fg_subtle, strikethrough = true },
        ["@markup.underline"]               = { underline = true },
        ["@markup.quote"]                   = { link = "Comment" },
        ["@markup.math"]                    = { fg = t.yellow },
        ["@markup.link"]                    = { fg = t.blue },
        ["@markup.link.label"]              = { fg = t.cyan },
        ["@markup.link.url"]                = { fg = t.blue, underline = true },
        ["@markup.link.label.markdown_inline"] = { fg = t.cyan },
        ["@markup.link.markdown_inline"]    = { fg = t.blue },
        ["@markup.raw"]                     = { fg = t.orange },
        ["@markup.raw.block"]               = { fg = t.orange },
        ["@markup.list"]                    = { fg = t.fg_muted },
        ["@markup.list.checked"]            = { fg = t.green, bold = true },
        ["@markup.list.unchecked"]          = { fg = t.plum,  bold = true },

        -- ── Misc ──────────────────────────────────────────────────────────
        ["@annotation"]                     = { link = "PreProc" },
        ["@attribute"]                      = { fg = t.jade },
        ["@attribute.builtin"]              = { fg = t.jade, italic = true },
        ["@symbol"]                         = { fg = t.pink_bright },
        ["@none"]                           = {},

        -- ── Legacy @text.* (pre-0.9 compat) ───────────────────────────────
        ["@text"]                           = { link = "@none" },
        ["@text.strong"]                    = { bold = true },
        ["@text.emphasis"]                  = { italic = true },
        ["@text.underline"]                 = { underline = true },
        ["@text.strike"]                    = { strikethrough = true },
        ["@text.title"]                     = { link = "markdownH1" },
        ["@text.title.2"]                   = { link = "markdownH2" },
        ["@text.title.3"]                   = { link = "markdownH3" },
        ["@text.literal"]                   = { link = "String" },
        ["@text.uri"]                       = { link = "Underlined" },
        ["@text.math"]                      = { link = "Special" },
        ["@text.reference"]                 = { link = "Constant" },
        ["@text.todo"]                      = { link = "Todo" },
        ["@text.note"]                      = { link = "SpecialComment" },
        ["@text.warning"]                   = { fg = t.orange, bold = true },
        ["@text.danger"]                    = { fg = t.red,    bold = true },

        -- ── Semantic token fallbacks ───────────────────────────────────────
        ["@lsp.type.class"]         = { link = "@type" },
        ["@lsp.type.decorator"]     = { link = "@attribute" },
        ["@lsp.type.enum"]          = { link = "@type" },
        ["@lsp.type.enumMember"]    = { fg = t.pink_bright },
        ["@lsp.type.function"]      = { link = "@function" },
        ["@lsp.type.interface"]     = { fg = t.purple, italic = true },
        ["@lsp.type.macro"]         = { link = "@function.macro" },
        ["@lsp.type.method"]        = { link = "@method" },
        ["@lsp.type.namespace"]     = { link = "@module" },
        ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
        ["@lsp.type.property"]      = { link = "@property" },
        ["@lsp.type.struct"]        = { link = "@type" },
        ["@lsp.type.type"]          = { link = "@type" },
        ["@lsp.type.typeParameter"] = { fg = t.purple, italic = true },
        ["@lsp.type.variable"]      = { link = "@variable" },
        ["@lsp.mod.deprecated"]     = { strikethrough = true },
        ["@lsp.mod.readonly"]       = { italic = true },
    }

    return hl
end

return M
