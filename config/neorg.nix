{
  extraConfigLua =
    # lua
    ''
      function _G.new_neorg_note()
        vim.ui.input({ prompt = "New Note: " }, function(input)
          if not input or input == "" then
            return
          end

          local neorg = require("neorg.core")
          local dirman = neorg.modules.get_module("core.dirman")
          local workspace = dirman.get_current_workspace()
          local name = input:gsub("%.norg$", "")
          local path = workspace[2] / name
          local destination = path:add_suffix(".norg")

          if destination:exists() then
            vim.cmd("edit " .. destination:cmd_string())
            return
          end

          dirman.create_file(name)
        end)
      end

      function _G.open_neorg_agenda()
        local neorg = require("neorg.core")
        local dirman = neorg.modules.get_module("core.dirman")
        local summary = neorg.modules.get_module("core.summary")
        local workspace = dirman.get_current_workspace()
        local destination = workspace[2] / "index.norg"

        if not destination:exists() then
          dirman.create_file("agenda")
          vim.api.nvim_buf_set_lines(0, 0, -1, false, { "* Agenda", "" })
          vim.cmd("write")
        else
          vim.cmd("edit " .. destination:cmd_string())
        end

        vim.api.nvim_win_set_cursor(0, { 1, 0 })
        vim.schedule(function()
          summary.generate_workspace_summary(0, { 1, 0 }, { "todos" })
        end)
      end
    '';

  plugins.neorg = {
    enable = true;
    settings = {
      load = {
        "core.defaults" = {
          __empty = null;
        };
        "core.concealer" = {
          __empty = null;
        };
        "core.qol.todo_items" = {
          __empty = null;
        };
        "core.summary" = {
          __empty = null;
        };
        "core.dirman" = {
          config = {
            workspaces = {
              secondbrain = "~/Documents/knowledge";
            };
            default_workspace = "secondbrain";
          };
        };
      };
    };
  };
}
