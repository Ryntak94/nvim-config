return {
	"romgrk/barbar.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("gitsigns").setup()
		require("barbar").setup({
			animation = false,
		})

		vim.keymap.set("n", "gt", ":BufferNext<CR>")
		vim.keymap.set("n", "gT", ":BufferPrevious<CR>")
		vim.keymap.set("n", "gmt", ":BufferMoveNext<CR>")
		vim.keymap.set("n", "gmT", ":BufferMovePrevious<CR>")
		vim.keymap.set("n", "<leader>bc", ":BufferClose<CR>")
	end,
	version = "^1.0.0",
}
