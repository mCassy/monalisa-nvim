<h1 align="center">MonaLisa</h1>

<p align="center">A dark and colorful theme for Neovim</p>

![MonaLisa Screenshot with a few windows](./assets/screenshot1.png)

Inspired by the painting and the iterm2 theme.

## Installation

`lazy.nvim`:

```lua
{
    "mCassy/monalisa-nvim",
    priority = 1000,
}
```

`vim.pack`:

```lua
vim.pack.add({ "https://github.com/mCassy/monalisa-nvim" })
```

## Usage

Basic usage:

```lua
vim.cmd.colorscheme("monalisa")
```

With configuration:

```lua
require("monalisa").setup({
    transparent = false,    -- Enable transparent backgrounds
    terminal_colors = true, -- Set terminal colors (0-15)
    italics = {
        comments = true,    -- Italic comments
        keywords = false,   -- Italic keywords
        functions = false,  -- Italic function names
        strings = false,    -- Italic strings
        variables = false,  -- Italic variables
        parameters = true,  -- Italic parameters
    },
    overrides = {},         -- Highlight group overrides
})
vim.cmd.colorscheme("monalisa")
```

### Italics

You can control italics globally or for specific syntax categories:

```lua
-- Disable all italics
require("monalisa").setup({
    italics = false,
})

-- Enable all italics
require("monalisa").setup({
    italics = true,
})

-- Fine-tune specific categories (default)
require("monalisa").setup({
    italics = {
        comments = true,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
        parameters = true,
    },
})
```

### Transparent Background

To enable transparent background (useful for terminal transparency):

```lua
require("monalisa").setup({
    transparent = true,
})
vim.cmd.colorscheme("monalisa")
```

### Custom Overrides

You can override specific highlight groups:

```lua
require("monalisa").setup({
    overrides = {
        Comment = { fg = "#888888", italic = false },
        LineNr = { fg = "#555555" },
    },
})
vim.cmd.colorscheme("monalisa")
```

### Lualine

MonaLisa includes a dedicated lualine theme:

```lua
require("lualine").setup({
    options = {
        theme = "monalisa",
    },
})
```

### Bufferline

For bufferline.nvim, the theme provides comprehensive highlight groups. Example setup:

```lua
require("bufferline").setup({
    highlights = require("bufferline").setup({
        options = {
            -- your options
        },
    }),
})
```

## Project Structure

```
lua/
├── lualine/
│   └── themes/
│       └── monalisa.lua    # Lualine theme
├── monalisa/
│   ├── init.lua            # Main entry point with setup() and load()
│   ├── config.lua          # Configuration options
│   ├── palette.lua         # Color definitions
│   └── groups/
│       ├── editor.lua      # Core editor highlights
│       ├── syntax.lua      # Syntax highlighting
│       ├── treesitter.lua  # Treesitter captures
│       ├── lsp.lua         # LSP & diagnostics
│       └── plugins.lua     # Plugin integrations
colors/
└── monalisa.lua            # Simple loader
```

## Supported Plugins

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [mini.nvim](https://github.com/echasnovski/mini.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)

## Contributing

This colorscheme is written in pure Lua. To modify colors, edit the files in `lua/monalisa/`:

- `palette.lua` - Color definitions
- `groups/*.lua` - Highlight group definitions

Format with [StyLua](https://github.com/JohnnyMorganz/StyLua):

```bash
stylua lua/
```
