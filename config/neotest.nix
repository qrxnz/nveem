{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neotest
    neotest-playwright
  ];

  extraConfigLua =
    /*
    lua
    */
    ''
      require("neotest").setup({
        adapters = {
          require("neotest-playwright").adapter({}),
        },
      })
    '';

  keymaps = [
    {
      key = "<leader>tt";
      mode = "n";
      action = ":lua require('neotest').run.run()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Run nearest test";
      };
    }
    {
      key = "<leader>tf";
      mode = "n";
      action = ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Run test file";
      };
    }
    {
      key = "<leader>to";
      mode = "n";
      action = ":lua require('neotest').output.open({ enter = true })<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Open test output";
      };
    }
    {
      key = "<leader>ts";
      mode = "n";
      action = ":lua require('neotest').summary.toggle()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle test summary";
      };
    }
  ];
}
