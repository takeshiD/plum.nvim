---@type plum.Palette
local colors = require("plum.colors").dark
local util = require("plum.util")

local deep_jade = util.blend(colors.jade, colors.bg, 0.7)
local deep_plum = util.blend(colors.plum, colors.bg, 0.7)
local deep_orange = util.blend(colors.orange, colors.bg, 0.7)
local plum = {
	normal = {
		a = { fg = colors.fg, bg = deep_plum },
		b = { fg = colors.plum, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
		x = { fg = colors.fg, bg = colors.bg },
		y = { fg = colors.purple, bg = colors.bg },
		z = { fg = colors.jade, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.fg, bg = deep_orange },
		b = { fg = colors.orange, bg = colors.bg },
		z = { fg = colors.jade, bg = colors.bg },
	},
	visual = {
		a = { fg = colors.fg, bg = colors.purple },
		b = { fg = colors.purple, bg = colors.bg },
		z = { fg = colors.jade, bg = colors.bg },
	},
	command = {
		a = { fg = colors.fg, bg = deep_jade },
		b = { fg = colors.jade, bg = colors.bg },
		z = { fg = colors.jade, bg = colors.bg },
	},
	replace = {
		a = { fg = colors.fg, bg = colors.cyan},
		b = { fg = colors.cyan, bg = colors.bg },
		z = { fg = colors.jade, bg = colors.bg },
	},
	terminal = {
		a = { fg = colors.fg, bg = colors.green },
		b = { fg = colors.green, bg = colors.bg },
		z = { fg = colors.jade, bg = colors.bg },
	},
}

return plum
