return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")

		vim.keymap.set("n", "<leader>da", ":DapContinue<CR>", {})
		vim.keymap.set("n", "<leader>sd", ":DapToggleBreakpoint<CR>", {})

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })

		require("dapui").setup()
		require("dap-go").setup()

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb", -- adjust as needed, must be absolute path
			name = "lldb",
		}

		dap.adapters.codelldb = {
			type = "server",
			host = "127.0.0.1",
			port = 13000, -- 💀 Use the port printed out or specified with `--port`
		}

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/usr/bin/codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
