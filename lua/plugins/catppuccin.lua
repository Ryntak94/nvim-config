return {
	"catppuccin/nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme catppuccin]])
		vim.api.nvim_set_hl()
	end,
}
