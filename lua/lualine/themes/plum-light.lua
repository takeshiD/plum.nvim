---@type plum.Palette
local colors = require("plum.colors").light
local util = require("plum.util")

local light_plum = util.blend(colors.plum, colors.bg, 0.7)
local light_orange = util.blend(colors.orange, colors.bg, 0.6)
local light_purple = util.blend(colors.purple, colors.bg, 0.5)
local plum = {
	normal = {
		a = { fg = colors.bg,     bg = light_plum },
		b = { fg = colors.plum,   bg = colors.bg },
		c = { fg = colors.fg,     bg = colors.bg },
		x = { fg = colors.fg,     bg = colors.bg },
		y = { fg = colors.purple, bg = colors.bg },
		z = { fg = colors.jade,   bg = colors.bg },
	},
	insert = {
		a = { fg = colors.bg,     bg = light_orange },
		b = { fg = colors.orange, bg = colors.bg },
		z = { fg = colors.jade,   bg = colors.bg },
	},
	visual = {
		a = { fg = colors.bg,     bg = light_purple },
		b = { fg = colors.purple, bg = colors.bg },
		z = { fg = colors.jade,   bg = colors.bg },
	},
	command = {
		a = { fg = colors.bg,     bg = colors.red },
		b = { fg = colors.red,    bg = colors.bg },
		z = { fg = colors.jade,   bg = colors.bg },
	},
	replace = {
		a = { fg = colors.bg,     bg = colors.jade},
		b = { fg = colors.jade,   bg = colors.bg },
		z = { fg = colors.jade,   bg = colors.bg },
	},
	terminal = {
		a = { fg = colors.bg,     bg = colors.green },
		b = { fg = colors.green,  bg = colors.bg },
		z = { fg = colors.jade,   bg = colors.bg },
	},
}

return plum
