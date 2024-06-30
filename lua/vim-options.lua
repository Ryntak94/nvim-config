
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.swapfile = false

vim.keymap.set("i", "kj", "<Esc>")
