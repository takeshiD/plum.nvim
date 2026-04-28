local theme = require("plum.theme")
local config = require("plum.config")
local util = require("plum.util")

local M = {}

---@param variant? plum.Variant
function M.load(variant)
	util.load(theme.setup(variant))
end

M.setup = config.setup
M.colorscheme = M.load

-- :PlumToggleMode — dark ↔ light をトグル（auto 時は vim.o.background で切替）
vim.api.nvim_create_user_command("PlumToggleMode", function()
	local opts = vim.g.plum_opts or config.options
	if opts.variant == "auto" then
		vim.o.background = vim.o.background == "dark" and "light" or "dark"
		vim.cmd("colorscheme plum")
		return
	end
	local next_variant = opts.variant == "dark" and "light" or "dark"
	config.setup({ variant = next_variant })
	M.load(next_variant)
	vim.api.nvim_exec_autocmds("User", { pattern = "PlumToggleMode", data = next_variant })
end, {})

-- auto variant: vim.o.background の変化に追随して再ロード
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		local opts = vim.g.plum_opts
		if not opts or opts.variant ~= "auto" then
			return
		end
		if vim.fn.execute("colorscheme"):find("plum") == nil then
			return
		end
		M.load()
	end,
})

return M
