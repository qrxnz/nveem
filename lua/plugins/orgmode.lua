return {
	"nvim-neorg/neorg",
	version = "v7.0.0", -- This is the important part!
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Sync/Orgfiles",
						},
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>oa", "<cmd>Neorg workspace notes<cr>", desc = "Orgmode" },
	},
}
