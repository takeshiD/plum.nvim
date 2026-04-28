local config = require("plum.config")

local variant = config.options.variant

if variant == "light" or (variant == "auto" and vim.o.background == "light") then
    return require("lualine.themes.plum-light")
end

return require("lualine.themes.plum-dark")
