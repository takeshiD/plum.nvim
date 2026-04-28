local M = {}

---@class plum.Highlight
---@field fg? string
---@field bg? string
---@field sp? string
---@field bold? boolean
---@field italic? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean
---@field link? string

---@alias plum.OverrideFn fun(palette: plum.Palette): table<string, plum.Highlight>
---@alias plum.Variant "dark"|"light"|"auto"

---@class plum.Extensions
---@field default? boolean  全拡張を一括で on/off する初期値
---@field telescope? boolean
---@field gitsigns? boolean
---@field cmp? boolean
---@field lazy? boolean
---@field whichkey? boolean
---@field noice? boolean
---@field mini? boolean
---@field dashboard? boolean
---@field indentblankline? boolean
---@field notify? boolean
---@field treesitter? boolean
---@field neotree? boolean

---@class plum.Config
---@field transparent? boolean
---@field variant? plum.Variant
---@field saturation? number
---@field colors? table
---@field highlights? table<string, plum.Highlight>
---@field overrides? plum.OverrideFn
---@field italic_comments? boolean
---@field hide_fillchars? boolean
---@field borderless_pickers? boolean
---@field terminal_colors? boolean
---@field extensions? plum.Extensions
local defaults = {
    transparent       = false,
    variant           = "dark",   -- "dark" | "light" | "auto"
    saturation        = 1,        -- 0–1、彩度スケール
    ---@diagnostic disable-next-line: missing-fields
    colors            = {},
    highlights        = {},
    italic_comments   = false,
    hide_fillchars    = false,
    borderless_pickers = false,
    terminal_colors   = true,
    extensions = {
        telescope      = true,
        gitsigns       = true,
        cmp            = true,
        lazy           = true,
        whichkey       = true,
        noice          = true,
        mini           = true,
        dashboard      = true,
        indentblankline = true,
        notify         = true,
        treesitter     = true,
        neotree        = true,
    },
}

---@type plum.Config
M.options = {}

---@param options? plum.Config
function M.setup(options)
    options = options or {}

    -- extensions.default で全拡張を一括 on/off できる
    if options.extensions and options.extensions.default ~= nil then
        local default_val = options.extensions.default
        local user_ext = vim.deepcopy(options.extensions)
        user_ext.default = nil

        local ext = {}
        for k in pairs(defaults.extensions) do
            ext[k] = default_val
        end
        for k, v in pairs(user_ext) do
            ext[k] = v
        end
        options.extensions = ext
    end

    M.options = vim.tbl_deep_extend("force", {}, defaults, options)
    vim.g.plum_opts = M.options
end

M.setup()

return M
