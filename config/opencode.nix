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

}
