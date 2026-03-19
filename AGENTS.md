# Agent Guidelines for Jibone's Dotfiles

This repository contains J.Shamsul's personal dotfiles, specifically tailored for macOS on an M2 MacBook Pro. These configs are **not intended for direct use** - use them as reference only.

## Repository Structure

```
.
├── alacritty/      # Alacritty terminal config (TOML)
├── ghostty/        # Ghostty terminal config
├── kitty/          # Kitty terminal config
├── nvim/           # NeoVim configuration (Lua)
├── skhd/           # Simple Hotkey Daemon (window management hotkeys)
├── sketchybar/     # Menu bar configuration (shell scripts)
├── tmux/           # Tmux terminal multiplexer
├── yabai/          # Tiling window manager
└── images/         # Screenshots
```

## Build/Lint/Test Commands

This is a configuration-only repository with no build step. However, individual tools have validation commands:

### NeoVim Configuration
- **Validate Lua syntax**: Open files in NeoVim and run `:checkhealth` or `:lua vim.lsp.diagnostic.enable()` for LSP diagnostics
- **Test Lazy.nvim setup**: Run `:Lazy sync` or `:Lazy` in NeoVim after changes
- **Format Lua**: Uses `stylua` via conform.nvim (auto-format on save)
- **Check LSP status**: Run `:LspInfo` to see active LSP servers
- **Mason package paths**: `:Mason` to manage LSP/DAP/formatter installations

### NeoVim LSP Configuration (v0.11+)
This repo uses Neovim's native `vim.lsp.config` API (not the deprecated `require('lspconfig').setup()`):
```lua
-- Configure a server
vim.lsp.config.<server_name> = {
  capabilities = capabilities,
  filetypes = { "lua" },
  root_markers = { ".git" },
  settings = { -- server-specific settings },
}

-- Enable the server (auto-starts when matching filetype opens)
vim.lsp.enable("<server_name>")

-- LSP keymaps are set in LspAttach autocmd (see lsp.lua)
```

### Shell Scripts (sketchybar, yabai, skhd)
- **Syntax check bash**: `bash -n script.sh` to validate syntax without execution
- **ShellCheck**: Install via `brew install shellcheck` and run `shellcheck script.sh`

### Tmux
- **Validate tmux.conf**: `tmux source-file ~/.tmux.conf` (requires running tmux session)

### Formatters Used
| File Type | Formatter | Configuration |
|-----------|-----------|---------------|
| Lua | stylua | 2-space indent, column width 120 |
| JS/TS/JSON/YAML | prettier | default config |
| Ruby | rubocop | default config |
| Go | goimports, gofmt, gofumpt | default config |
| Markdown | prettier, markdownlint-cli2 | default config |

## Code Style Guidelines

### NeoVim/Lua Conventions

#### Indentation & Formatting
- **2 spaces** for indentation (not tabs)
- Column limit: **120 characters**
- Use `local` for all variables and functions (no global pollution)
- One return statement per file (plugin specs return tables)

#### Plugin Spec Structure
```lua
return {
  "author/plugin-name",
  -- lazy-load by default (lazy = true)
  dependencies = { "dep1", "dep2" },
  config = function()
    require("plugin").setup({ ... })
  end,
}
```

#### Keymaps
```lua
local keymap = vim.keymap

-- mode, lhs, rhs, opts
keymap.set("n", "<leader>x", ":Command<CR>", { silent = true })
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
```

#### Options
```lua
local opt = vim.opt
opt.number = true
opt.tabstop = 2
opt.expandtab = true
```

#### Error Handling
- Use `vim.fn.system()` with error checking:
  ```lua
  local out = vim.fn.system({ "git", "clone", url, path })
  if vim.v.shell_error ~= 0 then
    -- handle error
  end
  ```
- Always check for existence of lazy.nvim plugins before requiring
- Use `pcall(require, "module")` for optional dependencies

### Shell Script Conventions (sketchybar)

#### Style
- Use `#!/bin/bash` shebang
- **2 spaces** for indentation
- UPPERCASE for exported variables (colors, constants)
- Double brackets `[[ ]]` for conditionals (more portable)
- Source config files: `source "$CONFIG_DIR/colors.sh"`
- Quote variables: `"$VAR"` not `$VAR`

#### Example Structure
```bash
#!/bin/bash

source "$CONFIG_DIR/colors.sh"

PLUGIN_DIR="$CONFIG_DIR/plugins"

sketchybar --add item item_name left \
           --set item_name icon="..." \
                             script="$PLUGIN_DIR/script.sh" \
           --subscribe item_name event.name
```

### Configuration File Conventions

#### TOML (Alacritty)
- Lowercase section headers: `[colors.primary]`
- String values quoted: `background = "#24283b"`
- No trailing commas in inline tables

#### skhd (Simple Hotkey Daemon)
- Format: `modifier - key : command`
- Modifiers: `alt`, `shift`, `ctrl`, `cmd`
- Commands separated by semicolons for multiple actions

#### tmux.conf
- Use `set -g` for global options
- Use `set -w` for window options
- Comment unused config with `#` prefix
- Chain related options with `\`

### Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Lua variables | snake_case | `local my_var = ...` |
| Lua functions | snake_case | `local function setup_plugin()` |
| Lua modules | snake_case | `require("my_plugin")` |
| Plugin keys | camelCase or kebab-case | `lazy = true`, `dependencies = {...}` |
| Keymap leader | descriptive | `<leader>ff`, `<leader>fs` |
| Shell variables | snake_case | `PLUGIN_DIR`, `ITEM_BG_COLOR` |
| Shell exports | UPPERCASE | `export BAR_COLOR=...` |

### File Organization

#### nvim/
```
lua/
├── init.lua          # Entry point, bootstrap lazy.nvim
├── options.lua       # Global editor settings
├── keymaps.lua       # Global keybindings
├── plugins.lua       # Core plugins (vim-tmux-navigator)
└── plugins/          # Individual plugin configs (one file per plugin)
    ├── lsp.lua
    ├── telescope.lua
    ├── treesitter.lua
    └── ...
```

#### sketchybar/
```
sketchybarrc      # Main config (sources other files)
colors.sh         # Color definitions (ARGB format: 0xRRGGBBAA)
items/            # Individual status bar items
│   ├── spaces.sh
│   ├── front_app.sh
│   └── ...
plugins/          # Item scripts
```

## Common Tasks

### Adding a New Plugin
1. Create new file: `nvim/lua/plugins/<plugin-name>.lua`
2. Return table with plugin spec
3. Restart NeoVim or run `:Lazy sync`

### Adding a New sketchybar Item
1. Create script in `sketchybar/items/<item-name>.sh`
2. Source it in `sketchybar/sketchybarrc`
3. Add `sketchybar --update` at end

### Modifying Terminal Config
- Alacritty: Edit `alacritty/alacritty.toml`
- Ghostty: Edit `ghostty/config` or add files in `ghostty/auto/`
- Kitty: Edit `kitty/kitty.conf`

## Important Notes

- This is a **personal dotfiles repo** - do not modify for general use
- All configurations are macOS-specific
- Neovim config checks for `vim.g.vscode` to disable plugins in VSCode
- Tmux prefix is remapped to `Ctrl-s`
- Window management is handled by yabai + skhd (bsp layout)
- Color scheme: Tokyo Night / Catppuccin Mocha / Purple scheme

## Version Info

- Neovim: v0.10+ (uses vim.uv, vim.keymap)
- Plugin Manager: Lazy.nvim (stable branch)
- Shell: Bash scripts (POSIX-compliant)
