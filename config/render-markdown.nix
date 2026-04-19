{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    render-markdown-nvim
  ];

  extraConfigLua =
    # lua
    ''
      require('render-markdown').setup({
        heading = {
          backgrounds = { "Normal", "Normal", "Normal", "Normal", "Normal", "Normal" },
        },
        code = {
          highlight = "Normal",
          highlight_inline = "Normal",
        },
        pipe_table = {
          head = "Normal",
          row = "Normal",
        },
      })
    '';
}
