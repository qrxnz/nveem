{pkgs, ...}: {
  plugins.lsp = {
    enable = true;
    servers = {
      asm_lsp = {
        enable = true;
        extraOptions.root_dir.__raw =
          # lua
          ''
            function(fname)
              return vim.loop.cwd()
            end
          '';
      };
      bashls.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      cssls.enable = true;
      gopls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nixd = {
        enable = true;
        settings.nixd.formatting.command = ["nixfmt"];
      };
      prismals = {
        enable = true;
        package = pkgs.prisma-language-server;
      };
      ruff.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        settings = {
          "rust-analyzer" = {
            cargo = {
              allFeatures = true;
            };
          };
        };
        extraOptions.root_dir.__raw =
          # lua
          ''
            function(fname)
              return vim.loop.cwd()
            end
          '';
      };
      ts_ls.enable = true;
      yamlls.enable = true;
      zls.enable = true;
    };
    keymaps = {
      lspBuf = {
        K = "hover";
        gd = "definition";
        gy = "type_definition";
        gi = "implementation";
        "<leader>r" = "rename";
      };
      diagnostic = {
        "<leader>dj" = "goto_next";
        "<leader>dk" = "goto_prev";
      };
    };
  };
  plugins.typescript-tools = {
    enable = true;
    settings = {
      separate_diagnostic_server = true;
      publish_diagnostic_on = "insert_leave";
      expose_as_code_action = [];
      tsserver_path = null;
      tsserver_plugins = [];
      tsserver_max_memory = "auto";
      tsserver_format_options = {};
      tsserver_file_preferences = {};
      tsserver_locale = "en";
      complete_function_calls = false;
      include_completions_with_insert_text = true;
      code_lens = "off";
      disable_member_code_lens = true;
      jsx_close_tag = {
        enable = false;
        filetypes = ["javascriptreact" "typescriptreact"];
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
  ];
}
