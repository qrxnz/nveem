return {
	"NvChad/nvterm",
	keys = {
		{ "<leader>ca", '<cmd>lua require("nvterm.terminal").toggle "horizontal"<cr>', desc = "Toggle Terminal" },
	},
	config = function()
		require("nvterm").setup({
			terminals = {
				default_type = "horizontal",
				horizontal = {
					split_ratio = 0.4,
				},
			},
		})

		vim.cmd([[ tnoremap <Esc> <C-\><C-n> ]])
	end,
}
