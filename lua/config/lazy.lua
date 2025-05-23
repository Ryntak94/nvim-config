-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>q", function()
   vim.wo.relativenumber = not vim.wo.relativenumber
end, {})

vim.api.nvim_create_user_command("CopyRelPath", "call setreg('*', expand('%:.'))", {})
vim.keymap.set("n", "<leader>cr", ":CopyRelPath<CR>")
vim.keymap.set("n", "<leader>lu", require("lazy").update)


-- Setup lazy.nvim
require("lazy").setup({
   spec = {
      -- import your plugins
      { import = "plugins" },
   },
   -- Configure any other settings here. See the documentation for more details.
   -- colorscheme that will be used when installing plugins.
   install = { colorscheme = { "habamax" } },
   -- automatically check for plugin updates
   checker = { enabled = true },
})

require("lazy.view.config").keys.close = "<Esc>"
