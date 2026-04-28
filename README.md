# plum.nvim

A high-contrast Neovim colorscheme inspired by the vivid colors of the **Japanese plum (すもも)** — the pink-red skin, orange-yellow flesh, and vivid green leaves.

## Variants

| Variant | Background | Character |
|---------|-----------|-----------|
| `plum-dark` | Near-black (`#0D0C0E`) | Full-chroma accents, WCAG AAA contrast |
| `plum-light` | Warm parchment (`#F7F2E2`) | Darkened accents, WCAG AA contrast |

## Color palette

Colors are derived from the plum's natural hues and organized by color theory:

| Role | Dark | Light | Hue | Source |
|------|------|-------|-----|--------|
| `pink` | `#FF3070` | `#C0124A` | 340° | Plum skin (primary) |
| `plum` | `#E03080` | `#8A1050` | 330° | Purple-red skin |
| `purple` | `#B060FF` | `#6018CC` | 275° | Triad |
| `blue` | `#48A8FF` | `#1840D8` | 210° | Triad |
| `cyan` | `#00E5E5` | `#007888` | 180° | Complement of pink |
| `jade` | `#18CDB5` | `#0A7870` | 172° | Complement family |
| `green` | `#35E888` | `#0A8840` | 145° | Plum leaf |
| `yellow` | `#FFD838` | `#9A6400` | 42° | Plum flesh |
| `orange` | `#FFA020` | `#B85800` | 28° | Plum flesh |
| `red` | `#FF2040` | `#C00830` | 357° | Error (pure red) |

## Requirements

- Neovim 0.9+
- `termguicolors` enabled

## Installation

### lazy.nvim

```lua
{
    "your-username/plum.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("plum").setup({
            -- options (all optional)
        })
        vim.cmd("colorscheme plum-dark")
    end,
}
```

### vim-plug

```vim
Plug 'your-username/plum.nvim'
colorscheme plum-dark
```

## Configuration

Call `setup()` before applying the colorscheme. All options are optional.

```lua
require("plum").setup({
    -- "dark" | "light" | "auto" (follows vim.o.background)
    variant = "dark",

    -- Replace bg with "NONE" for transparent backgrounds
    transparent = false,

    -- Desaturate all colors (0.0 = grayscale, 1.0 = full color)
    saturation = 1,

    -- Apply italic to comments
    italic_comments = false,

    -- Hide window separator fill characters
    hide_fillchars = false,

    -- Borderless style for telescope/fzf pickers
    borderless_pickers = false,

    -- Set terminal colors (vim.g.terminal_color_*)
    terminal_colors = true,

    -- Override individual palette colors
    colors = {
        -- applies to both variants:
        -- pink = "#FF0066",
        -- per-variant overrides:
        -- dark  = { bg = "#000000" },
        -- light = { bg = "#FFFFFF" },
    },

    -- Override specific highlight groups (table or function)
    highlights = {
        -- Comment = { fg = "#999999", italic = true },
    },
    -- or as a function receiving the resolved palette:
    -- overrides = function(t)
    --     return { Comment = { fg = t.fg_subtle } }
    -- end,

    -- Enable/disable plugin integrations
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
        -- Disable all extensions except specific ones:
        -- default = false,
        -- telescope = true,
    },
})
```

## Switching variants

```vim
" Apply directly
:colorscheme plum-dark
:colorscheme plum-light

" Toggle with command
:PlumToggleMode
```

```lua
-- Toggle programmatically
vim.cmd("PlumToggleMode")

-- Listen for toggle events
vim.api.nvim_create_autocmd("User", {
    pattern = "PlumToggleMode",
    callback = function(ev)
        -- ev.data contains "dark" or "light"
    end,
})
```

## Supported plugins

| Plugin | Extension key |
|--------|--------------|
| telescope.nvim | `telescope` |
| gitsigns.nvim | `gitsigns` |
| nvim-cmp | `cmp` |
| lazy.nvim | `lazy` |
| which-key.nvim | `whichkey` |
| noice.nvim | `noice` |
| mini.nvim | `mini` |
| dashboard.nvim / alpha.nvim | `dashboard` |
| indent-blankline.nvim | `indentblankline` |
| nvim-notify | `notify` |
| nvim-treesitter | `treesitter` |

## License

MIT
