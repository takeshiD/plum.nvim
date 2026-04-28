local colors = require("plum.colors")
local util = require("plum.util")

local M = {}

---@param variant? plum.Variant
---@return { highlights: table<string, table> }
function M.setup(variant)
	local config = require("plum.config")
	local opts = config.options

	if variant then
		opts.variant = variant
	end

	-- variant 解決
	---@type plum.Palette
	local t = colors.dark
	if opts.variant == "light" then
		t = colors.light
	elseif opts.variant == "auto" then
		t = vim.o.background == "light" and colors.light or colors.dark
	end

	-- 彩度スケール適用
	t = util.apply_saturation(t, opts.saturation)

	-- ユーザー color オーバーライド
	local color_overrides = opts.colors or {}
	local current_variant = opts.variant == "auto" and vim.o.background or opts.variant
	if color_overrides[current_variant] then
		t = vim.tbl_deep_extend("force", t, color_overrides[current_variant])
	end
	-- variant キーを除いた汎用オーバーライド
	local general = vim.tbl_deep_extend("keep", {}, color_overrides)
	general.dark = nil
	general.light = nil
	general.auto = nil
	t = vim.tbl_deep_extend("force", t, general)

	-- transparent 時に bg を NONE にするが blend 計算用の実色を保持
	t.bg_solid = (t.bg ~= "NONE") and t.bg or t.bg_alt
	if opts.transparent then
		t.bg = "NONE"
	end

	-- fillchars を非表示にするオプション
	if opts.hide_fillchars then
		vim.opt.fillchars:append({
			horiz = " ",
			horizup = " ",
			horizdown = " ",
			vert = " ",
			vertleft = " ",
			vertright = " ",
			verthoriz = " ",
			eob = " ",
		})
	end

	-- ターミナルカラー設定
	if opts.terminal_colors then
		vim.g.terminal_color_0 = t.bg
		vim.g.terminal_color_8 = t.bg_alt
		vim.g.terminal_color_7 = t.fg
		vim.g.terminal_color_15 = t.fg_muted
		vim.g.terminal_color_1 = t.red
		vim.g.terminal_color_9 = t.red
		vim.g.terminal_color_2 = t.green
		vim.g.terminal_color_10 = t.green
		vim.g.terminal_color_3 = t.yellow
		vim.g.terminal_color_11 = t.yellow
		vim.g.terminal_color_4 = t.blue
		vim.g.terminal_color_12 = t.blue
		vim.g.terminal_color_5 = t.purple
		vim.g.terminal_color_13 = t.purple
		vim.g.terminal_color_6 = t.cyan
		vim.g.terminal_color_14 = t.cyan
	end

	local theme = {}

	-- base ハイライトを必ず読み込む
	theme.highlights = require("plum.extensions.base").get(opts, t)

	-- 有効な拡張を順次マージ
	local extensions = opts.extensions or {}
	for ext_name, enabled in pairs(extensions) do
		if enabled then
			local ok, ext = pcall(require, "plum.extensions." .. ext_name)
			if ok then
				theme.highlights = vim.tbl_deep_extend("force", theme.highlights, ext.get(opts, t))
			end
		end
	end

	-- ユーザー ハイライトオーバーライド（関数形式または table 形式）
	local overrides = opts.overrides or opts.highlights
	if type(overrides) == "function" then
		overrides = overrides(t)
	end
	if overrides then
		theme.highlights = vim.tbl_extend("force", theme.highlights, overrides)
	end

	return theme
end

return M
