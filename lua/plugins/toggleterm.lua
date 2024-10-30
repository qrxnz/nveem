return {
	"NvChad/nvterm",
	keys = {
		{ "<leader>ca", '<cmd>lua require("nvterm.terminal").toggle "float"<cr>', desc = "Toggle Terminal" },
	},
	config = function()
		require("nvterm").setup({})

		vim.cmd([[ tnoremap <Esc> <C-\><C-n> ]])
	end,
}
