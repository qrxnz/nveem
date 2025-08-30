{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./style.nix
    ./telescope.nix
    ./treesitter.nix
    ./folds.nix
    ./lsp.nix
    ./completion.nix
    ./format.nix
    ./lint.nix
    ./debug.nix
    ./neotree.nix
  ];

  config = {
    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = false;
      shiftwidth = 2;
      tabstop = 2;
      wrap = false;
      swapfile = false; # Undotree
      backup = false; # Undotree
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      showtabline = 2;
      updatetime = 50;
      foldlevelstart = 99;
      list = true;
      listchars = "eol:↲,tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";
    };

    plugins = {
      gitsigns.enable = true;
      oil.enable = true;
      undotree.enable = true;
      fugitive.enable = true;

      markdown-preview = {
        enable = true;
        settings = {
          browser = "Brave\ Browser";
        };
      };
    };
    extraPackages = with pkgs; [
      # Formatters
      asmfmt
      astyle
      black
      cmake-format
      gofumpt
      golines
      gotools
      isort
      alejandra
      nodePackages.prettier
      prettierd
      rustfmt
      shfmt
      stylua
      # Linters
      eslint_d
      gitlint
      golangci-lint
      hadolint
      html-tidy
      luajitPackages.luacheck
      markdownlint-cli
      nodePackages.jsonlint
      pylint
      ruff
      shellcheck
      vale
      yamllint
      # Debuggers / misc deps
      asm-lsp
      bashdb
      clang-tools
      delve
      fd
      (
        if stdenv.isDarwin
        then null
        else gdb
      ) # Not supported on MacOS
      go
      lldb_17
      llvmPackages_17.bintools-unwrapped
      marksman

      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "RobotoMono"
        ];
      })

      python3
      ripgrep
      (
        if stdenv.isDarwin
        then null
        else rr
      ) # Not supported on MacOS
      tmux-sessionizer
      typescript
      zig
    ];
  };
}
