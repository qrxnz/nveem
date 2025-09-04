{pkgs, ...}: {
  keymaps = [
    {
      key = "<leader>u";
      mode = "n";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "[u]ndotree toggle";
      };
    }
    {
      key = "<leader>tr";
      mode = "n";
      action = "<cmd>Neotree float<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Explorer NeoTree (cwd)";
      };
    }
    {
      key = "<leader>Y";
      mode = "n";
      action = "\"+Y";
      options = {
        silent = true;
        noremap = true;
        desc = "[Y]ank line to system clipboard";
      };
    }
    {
      key = "<C-k>";
      mode = "n";
      action = "<cmd>cnext<CR>zz";
      options = {
        silent = true;
        noremap = true;
        desc = "Next quickfix";
      };
    }
    {
      key = "<C-j>";
      mode = "n";
      action = "<cmd>cprev<CR>zz";
      options = {
        silent = true;
        noremap = true;
        desc = "Prev quickfix";
      };
    }
    {
      key = "<leader>k";
      mode = "n";
      action = "<cmd>lnext<CR>zz";
      options = {
        silent = true;
        noremap = true;
        desc = "Next quickfix location";
      };
    }
    {
      key = "<leader>j";
      mode = "n";
      action = "<cmd>lprev<CR>zz";
      options = {
        silent = true;
        noremap = true;
        desc = "Prev quickfix location";
      };
    }
    {
      key = "<leader>mp";
      mode = ["n" "v"];
      action = ":lua _G.format_with_conform()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "make pretty by formatting";
      };
    }
    {
      key = "<leader>da";
      mode = "n";
      action = ":lua vim.lsp.buf.code_action()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "diagnostic changes accepted";
      };
    }
    {
      key = "<leader>t";
      mode = "n";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle nvim tree";
      };
    }

    # DAP Debugging
    {
      key = "<leader>b";
      mode = "n";
      action = ":lua require'dap'.toggle_breakpoint()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle DAP breakpoint";
      };
    }
    {
      key = "<leader>sd";
      mode = "n";
      action = ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Set DAP Breakpoint";
      };
    }
    {
      key = "<leader>dtg";
      mode = "n";
      action = ":lua require'dap-go'.debug_test()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "DAP debug test for (g)o";
      };
    }
    {
      key = "<leader>re";
      mode = "n";
      action = ":lua require'dap'.repl.open()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "dap repl open";
      };
    }
    {
      key = "<leader>lp";
      mode = "n";
      action = ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "log DAP [p]oint message";
      };
    }
    {
      key = "<F5>";
      mode = "n";
      action = ":lua require'dap'.continue()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Continue DAP debug";
      };
    }
    {
      key = "<F10>";
      mode = "n";
      action = ":lua require'dap'.step_over()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Step over DAP debug";
      };
    }
    {
      key = "<F11>";
      mode = "n";
      action = ":lua require'dap'.step_into()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Step into DAP debug";
      };
    }
    {
      key = "<F12>";
      mode = "n";
      action = ":lua require'dap'.step_out()<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Stepout of DAP debug";
      };
    }
  ];
}
