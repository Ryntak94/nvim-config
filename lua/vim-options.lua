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

---@diagnostic disable-next-line: unused-local
local editorconfig = require("editorconfig")
