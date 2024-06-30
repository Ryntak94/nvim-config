return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
    vim.keymap.set("n", "gt", ":BufferNext<CR>")
    vim.keymap.set("n", "gT", ":BufferPrevious<CR>")
    vim.keymap.set("n", "gmt", ":BufferMoveNext<CR>")
    vim.keymap.set("n", "gmT", ":BufferMovePrevious<CR>")
    vim.keymap.set("n", "<leader>bc", ":BufferClose<CR>")
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = false,
		-- insert_at_start = true,
		-- …etc.
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
