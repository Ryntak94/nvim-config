return {
	"sindrets/diffview.nvim",
	config = function()
    local diffview = require("diffview")
		vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>")
		vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>")
	end,
}
