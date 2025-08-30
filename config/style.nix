{...}: {
  colorschemes = {
    catppuccin = {
      enable = true;
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      flavour = "frappe"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      disableBold = false;
      disableItalic = false;
      disableUnderline = false;
      transparentBackground = true;
      integrations = {
        cmp = true;
        noice = true;
        notify = true;
        neotree = true;
        harpoon = true;
        gitsigns = true;
        which_key = true;
        illuminate = {
          enabled = true;
        };
        treesitter = true;
        treesitter_context = true;
        telescope.enabled = true;
        indent_blankline.enabled = true;
        mini.enabled = true;
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          underlines = {
            errors = ["underline"];
            hints = ["underline"];
            information = ["underline"];
            warnings = ["underline"];
          };
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
      presets = {
        bottom_search = true;
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
        kindIcons = false;
      };
      extraOptions = {
        inc_rename.cmdline.format.IncRename = {
          icon = "⟳";
        };
      };
    };
  };
  extraConfigLua =
    # lua
    ''
          -- Noice recommended config
          require("noice").setup({
          	lsp = {
          		override = {
          			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          			["vim.lsp.util.stylize_markdown"] = true,
          			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          		},
          	},
          })
          -- Show @recording in the statusline
          -- see: https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
             require("lualine").setup({
      	options = {
      		theme = "palenight",
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
