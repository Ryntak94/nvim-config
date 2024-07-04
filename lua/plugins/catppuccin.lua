return {
	"catppuccin/nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme catppuccin]])
		require("nvim-web-devicons").setup({})
	end,
}
