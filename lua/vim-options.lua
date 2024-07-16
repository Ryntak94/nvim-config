vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.swapfile = false

vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<esc>", ":noh <CR>")

local client = vim.lsp.start_client({
	name = "go-lsp",
	cmd = { "./main" },
	cmd_cwd = "/Users/ryan/Work/test/vs-code-go-lsp-extension/go-lsp/bin",
})

if not client then
	vim.notify("hey, you didn't do the client thing good")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
