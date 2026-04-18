{...}: {
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "default";
          path = "~/Documents/SecondBrain";
        }
      ];
      completion = {
        nvim_cmp = true;
        min_chars = 2;
      };
      mappings = {
        # Overrides the 'gf' mapping to work with obsidian.nvim
        gf = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            noremap = false;
            expr = true;
            buffer = true;
          };
        };
        # Toggle check-boxes
        "<leader>ch" = {
          action = "require('obsidian').util.toggle_checkbox";
          opts = {
            buffer = true;
          };
        };
      };
    };
  };
}
