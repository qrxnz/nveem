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

      -- Link internal highlight groups to Normal to ensure transparency
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
        }
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { link = "Normal" })
        end
      end

      set_markdown_transparency()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_markdown_transparency,
      })
    '';
}
