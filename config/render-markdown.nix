{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    render-markdown-nvim
  ];

  extraConfigLua =
    # lua
    ''
      require('render-markdown').setup({
        heading = {
          -- Disable background highlights for headings
          backgrounds = {},
        },
        code = {
          -- Restore default style to keep icons/labels
          style = 'full',
        },
        pipe_table = {
        },
        padding = {
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
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
          "RenderMarkdownCodeBorder",
          "RenderMarkdownSign",
          "RenderMarkdownDash",
          "RenderMarkdownMath",
          "RenderMarkdownInlineHighlight",
          "RenderMarkdownCodeLanguage",
          "RenderMarkdownBullet",
        }
        for _, group in ipairs(groups) do
          local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
          hl.bg = "NONE"
          hl.ctermbg = "NONE"
          vim.api.nvim_set_hl(0, group, hl)
        end
      end

      vim.schedule(set_markdown_transparency)

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.schedule(set_markdown_transparency)
        end,
      })
    '';
}
