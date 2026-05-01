local theme = require("plum.theme")
local config = require("plum.config")
local util = require("plum.util")

local M = {}

---@param variant? plum.Variant
---@return "dark"|"light"
local function resolve_variant(variant)
	local opts = config.options
	local selected = variant or opts.variant

	if selected == "auto" then
		return vim.o.background == "light" and "light" or "dark"
	end

	return selected
end

---@param variant? plum.Variant
function M.load(variant)
	local resolved = resolve_variant(variant)
	util.load(theme.setup(variant), "plum-" .. resolved)
end

M.setup = config.setup
M.colorscheme = M.load

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
