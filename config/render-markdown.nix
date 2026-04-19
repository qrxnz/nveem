{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    render-markdown-nvim
  ];

  extraConfigLua =
    # lua
    ''
      require('render-markdown').setup({})

      -- Transparency overrides
      local groups = {
        'RenderMarkdownCode',
        'RenderMarkdownCodeInline',
        'RenderMarkdownSign',
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      }
      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = 'none' })
      end
    '';
}
