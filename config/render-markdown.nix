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

      -- Force transparency for markdown render groups
      local function apply_markdown_transparency()
        -- Use getcompletion to find all groups dynamically if possible, or just hardcode the known ones
        -- Since getcompletion might not work well in all contexts, we'll combine both
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

        -- Dynamically add any other groups starting with RenderMarkdown
        local dynamic_groups = vim.fn.getcompletion('RenderMarkdown', 'highlight')
        for _, g in ipairs(dynamic_groups) do
          if not vim.tbl_contains(groups, g) then
            table.insert(groups, g)
          end
        end

        for _, group in ipairs(groups) do
          local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = true })
          if ok and (hl.bg or hl.ctermbg) then
            local new_hl = {}
            for k, v in pairs(hl) do new_hl[k] = v end
            new_hl.bg = "NONE"
            new_hl.ctermbg = "NONE"
            vim.api.nvim_set_hl(0, group, new_hl)
          end
        end
      end

      -- Schedule the initial application
      vim.schedule(apply_markdown_transparency)

      -- Also defer it slightly to catch plugin lazy-loading
      vim.defer_fn(apply_markdown_transparency, 100)

      -- Persist across theme changes and file loads
      vim.api.nvim_create_autocmd({"ColorScheme", "FileType"}, {
        pattern = {"*", "markdown"},
        callback = function()
          vim.schedule(apply_markdown_transparency)
        end,
      })
    '';
}
