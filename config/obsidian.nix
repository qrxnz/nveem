{...}: {
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "default";
          path = "~/obsidian";
        }
      ];
      completion = {
        nvim_cmp = true;
        min_chars = 2;
      };
      mappings = {
        # Overrides the 'gf' mapping to work with obsidian.nvim
        gf = {
          action = {
            __raw = "function() return require('obsidian').util.gf_passthrough() end";
          };
          opts = {
            noremap = false;
            expr = true;
            buffer = true;
          };
        };
        # Toggle check-boxes
        "<leader>ch" = {
          action = {
            __raw = "function() return require('obsidian').util.toggle_checkbox() end";
          };
          opts = {
            buffer = true;
          };
        };
      };
    };
  };
}
