return {
	"vim-test/vim-test",
  config = function ()
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
    vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")
    vim.keymap.set("n", "<leader>lt", ":TestLast<CR>")
    vim.keymap.set("n", "<leader>lv", ":TestVisit<CR>")
  end
}
