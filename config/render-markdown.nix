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
          highlight = 'Normal',
        },
        pipe_table = {
          highlight = 'Normal',
        },
        padding = {
          highlight = 'Normal',
        },
      })

      -- Force transparency for internal highlight groups
      local function set_markdown_transparency()
        local groups = {
          "RenderMarkdownCode",
          "RenderMarkdownCodeInline",
          "RenderMarkdownTableHead",
          "RenderMarkdownTableRow",
          "RenderMarkdownTableFill",
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
          "RenderMarkdownPadding",
          "RenderMarkdownQuote",
        }
        for _, group in ipairs(groups) do
          local hl = vim.api.nvim_get_hl(0, { name = group, link = true })
          local new_hl = {}
          for k, v in pairs(hl) do new_hl[k] = v end
          new_hl.bg = "NONE"
          new_hl.ctermbg = "NONE"
          vim.api.nvim_set_hl(0, group, new_hl)
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
