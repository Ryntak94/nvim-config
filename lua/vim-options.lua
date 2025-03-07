vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.swapfile = false

vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<esc>", ":noh <CR>")

local editorconfig = require("editorconfig")

-- local client = vim.lsp.start_client({
--    name = "go-lsp",
--    cmd = { "./main" },
--    cmd_cwd = "/Users/ryan/Work/go-lsp/bin",
-- })
--
-- if not client then
--    vim.notify("hey, you didn't do the client thing good")
--    return
-- end
--
-- vim.api.nvim_create_autocmd("FileType", {
--    pattern = "go",
--    callback = function()
--       vim.lsp.buf_attach_client(0, client)
--    end,
-- })
