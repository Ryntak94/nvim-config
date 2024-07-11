return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		require("gitsigns").setup()

		vim.g.barbar_auto_setup = false

		vim.keymap.set("n", "gt", ":BufferNext<CR>")
		vim.keymap.set("n", "gT", ":BufferPrevious<CR>")
		vim.keymap.set("n", "gmt", ":BufferMoveNext<CR>")

		vim.keymap.set("n", "gmT", ":BufferMovePrevious<CR>")
		vim.keymap.set("n", "<leader>bc", ":BufferClose<CR>")
	end,
	opts = {
		animation = false,
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
