{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.opencode-nvim
  ];

  opts.autoread = true;

  extraConfigLua = ''
    _G.opencode_toggle_narrow = function()
      local width = math.floor(vim.o.columns * 0.30)
      vim.cmd("botright " .. width .. "vsplit")
      vim.cmd("terminal opencode --port")
      vim.cmd("startinsert")
    end
  '';

  keymaps = [
    {
      key = "<leader>ai";
      mode = ["n" "x"];
      action = ":lua require('opencode').ask('@this: ', { submit = true })<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Ask opencode";
      };
    }
    {
      key = "<leader>at";
      mode = "n";
      action = ":lua opencode_toggle_narrow()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle opencode";
      };
    }
  ];
}
