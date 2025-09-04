# GEMINI.md - nveem Project

## Project Overview

This project is a Neovim configuration managed using Nix and the `nixvim` flake. It provides a comprehensive development environment with support for multiple programming languages, debugging, formatting, linting, and a modern user interface.

The configuration is modular, with different features separated into individual `.nix` files within the `config/` directory. The main entry point is `flake.nix`, which imports the configuration from `config/default.nix`.

### Key Features:

*   **Plugin Management:** All Neovim plugins are managed by Nix, ensuring reproducible and declarative configuration.
*   **Language Server Protocol (LSP):** Integrated LSP support for various languages, including Bash, C/C++, CMake, CSS, Go, HTML, JSON, Lua, Nix, Prisma, Python, Rust, TypeScript/JavaScript, and YAML.
*   **Code Completion:** Autocompletion provided by `nvim-cmp` with sources for LSP, paths, snippets, and buffers.
*   **Formatting:** Code formatting on save using `conform.nvim`, with support for a wide range of formatters.
*   **Linting:** Linting support with `lint.nvim` for various languages.
*   **Debugging:** Debugging capabilities with `nvim-dap` for Go, Python, C/C++, Rust, and Zig.
*   **File Explorer:** A file explorer is provided by `neo-tree`.
*   **Fuzzy Finder:** `telescope.nvim` is configured for finding files, buffers, and searching for text.
*   **Git Integration:** Git integration with `gitsigns`.
*   **Syntax Highlighting:** Enhanced syntax highlighting with `nvim-treesitter`.
*   **Styling:** A modern look and feel with the `catppuccin` theme, `lualine` status line, and `noice` for a better command line experience.

## Building and Running

### Prerequisites

*   Nix package manager installed.
*   Flakes enabled in your Nix configuration.

### Installation and Usage

You can try this Neovim configuration without installing it permanently:

```sh
nix run github:qrxnz/nveem
```

To install it, you can add it as an input to your own `flake.nix`:

```nix
{
  inputs = {
    nveem = {
      url = "github:qrxnz/nveem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Then, you can add it to your system packages in NixOS or home-manager:

```nix
# For NixOS
environment.systemPackages = [ inputs.nveem.packages.${pkgs.system}.default ];

# For home-manager
home.packages = [ inputs.nveem.packages.${pkgs.system}.default ];
```

Alternatively, you can install it imperatively:

```sh
nix profile install github:qrxnz/nveem
```

## Development Conventions

The configuration is structured in a modular way. Each file in the `config/` directory is responsible for a specific part of the configuration.

*   `config/default.nix`: The main configuration file, which imports all other configuration files and sets global options.
*   `config/keymaps.nix`: Defines custom key mappings.
*   `config/style.nix`: Configures the visual style, including the colorscheme, status line, and other UI elements.
*   `config/telescope.nix`: Configures the Telescope fuzzy finder.
*   `config/treesitter.nix`: Configures nvim-treesitter for syntax highlighting and text objects.
*   `config/folds.nix`: Configures code folding.
*   `config/lsp.nix`: Configures the Language Server Protocol clients.
*   `config/completion.nix`: Configures code completion with nvim-cmp.
*   `config/format.nix`: Configures code formatting.
*   `config/lint.nix`: Configures linting.
*   `config/debug.nix`: Configures the debugger.
*   `config/neotree.nix`: Configures the Neo-tree file explorer.

To add a new plugin, you can add it to the `extraPlugins` list in `config/default.nix` and create a new `.nix` file in the `config/` directory to configure it. Then, import the new file in `config/default.nix`.

## Keymaps

Here are some of the most important keymaps:

| Keybinding      | Description                               |
| --------------- | ----------------------------------------- |
| `<leader>u`     | Toggle Undotree                           |
| `<leader>tr`    | Toggle Neo-tree file explorer             |
| `<leader>Y`     | Yank line to system clipboard             |
| `<leader>mp`    | Format the current buffer                 |
| `<leader>da`    | Show code actions                         |
| `<leader>b`     | Toggle DAP breakpoint                     |
| `<F5>`          | Continue DAP debugging                    |
| `<F10>`         | Step over in DAP debugger                 |
| `<F11>`         | Step into in DAP debugger                 |
| `<F12>`         | Step out in DAP debugger                  |
| `<leader>?`     | Find recently opened files with Telescope |
| `<leader>fb`    | Find existing buffers with Telescope      |
| `<leader>ff`    | Find files with Telescope                 |
| `<leader>sg`    | Live grep with Telescope                  |
| `<leader>sd`    | Search diagnostics with Telescope         |
| `<leader>sk`    | Search keymaps with Telescope             |
