{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    render-markdown-nvim
  ];

  extraConfigLua =
    # lua
    ''
      require('render-markdown').setup({
        heading = {
          -- Disable solid backgrounds for headings
          backgrounds = {},
        },
        code = {
          -- Use 'none' style to avoid solid background bars
          style = 'none',
          highlight = "Normal",
          highlight_inline = "Normal",
        },
        pipe_table = {
          head = "Normal",
          row = "Normal",
        },
        padding = {
          highlight = "Normal",
        },
      })

      -- Force transparency for internal highlight groups
      local function set_markdown_transparency()
        local groups = {
          "RenderMarkdownCode",
          "RenderMarkdownCodeInline",
          "RenderMarkdownTableHead",
          "RenderMarkdownTableRow",
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
          "RenderMarkdownCodeBorder",
          "RenderMarkdownSign",
          "RenderMarkdownDash",
          "RenderMarkdownMath",
          "RenderMarkdownInlineHighlight",
          "RenderMarkdownCodeLanguage",
        }
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
        end
      end

      set_markdown_transparency()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_markdown_transparency,
      })
    '';
}
