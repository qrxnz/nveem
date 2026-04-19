{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    render-markdown-nvim
  ];

  extraConfigLua =
    # lua
    ''
      require('render-markdown').setup({})

      local function set_markdown_transparency()
        local groups = {
          'RenderMarkdownCode',
          'RenderMarkdownCodeInline',
          'RenderMarkdownSign',
          'RenderMarkdownTableHead',
          'RenderMarkdownTableRow',
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
      end

      set_markdown_transparency()

      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = set_markdown_transparency,
      })
    '';
}
