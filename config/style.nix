{...}: {
  colorschemes = {
    rose-pine = {
      enable = true;
      settings = {
        variant = "main";
        styles = {
          bold = true;
          italic = true;
        };
      };
    };
  };
  plugins = {
    notify.enable = true;
    lualine = {
      enable = true;
    };
    noice = {
      enable = true;
      settings = {
        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        presets = {
          bottom_search = true;
          inc_rename = true;
        };
        cmdline.format = {
          cmdline = {
            icon = ">";
          };
          search_down = {
            icon = "🔍⌄";
          };
          search_up = {
            icon = "🔍⌃";
          };
          filter = {
            icon = "$";
          };
          lua = {
            icon = "☾";
          };
          help = {
            icon = "?";
          };
          IncRename = {
            icon = "⟳";
          };
        };
        format = {
          level = {
            icons = {
              error = "✖";
              warn = "▼";
              info = "●";
            };
          };
        };
        popupmenu = {
          kind_icons = false;
        };
      };
    };
  };

  extraConfigLua =
    # lua
    ''
          -- Show @recording in the statusline
          -- see: https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
             require("lualine").setup({
      	options = {
      		theme = "rose-pine",
      		component_separators = { left = "|", right = "|" },
      		section_separators = { left = "|", right = "|" },
      	},
      	sections = {
      		lualine_a = { "mode" },
      		lualine_b = { "branch", "diff" },
      		lualine_c = { "buffers" },
      		lualine_x = { "tabs" },
      		lualine_y = { "progress" },
      		lualine_z = {
      			{
      				"diagnostics",
      				sources = { "nvim_diagnostic", "nvim_lsp" },
      				sections = { "error", "warn", "info", "hint" },
      				diagnostics_color = {
      					-- Same values as the general color option can be used here.
      					error = "DiagnosticError", -- Changes diagnostics' error color.
      					warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
      					info = "DiagnosticInfo", -- Changes diagnostics' info color.
      					hint = "DiagnosticHint", -- Changes diagnostics' hint color.
      				},
      				symbols = { error = "E", warn = "W", info = "I", hint = "H" },
      				colored = true, -- Displays diagnostics status in color if set to true.
      				update_in_insert = false, -- Update diagnostics in insert mode.
      				always_visible = false, -- Show diagnostics even if there are none.
      			},
      		},
      	},
      })
    '';
}
