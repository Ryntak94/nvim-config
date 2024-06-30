This is my own personal nvim configuration. I'll walk you through the different pieces.

This largely comes from the [youtube series](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) by typecraft, with a few modifications of my own.

The `init.lua` file here at the root simply loads the options from the `lua/vim-options.lua` file, and then the lazy plugin manager which is configured in `lua/config/lazy.lua`

The `vim-options.lua` file sets a few options. Some basic key bindings, relative linen numbers, turns off swap files (a system for preventing the same file open in two places from being overwritten on accident), and some general text formatting options.

The `lazy.lua` file in the plugin directory configures the lazy plugin manager, as well as the mapleader which by default is the space key. Whenever you see `<leader>` this is what it's referring to. Lazy will automatically load all of the plugins in the plugin folder.

The `alpha-dashboard.lua` plugin is just the dashboard displayed when you open nvim.

The `autopair.lua` plugin is used for automatically generating closing quotes and brackets.

The `catpuccin.lua` plugin is a colorscheme. This will not work in Mac's `Terminal.app`

The `completions.lua` plugin is configured for autocompletion and snippets for lua and javascript.

The `barbar.lua` plugin is for tabs. I've created a few useful mappings. A couple things to note: `:q` doesn't close a buffer/tab. It closes a window. If you are in a tab and want to close it, `:q` will likely close more than the tab you are viewing. Use `<leader>bc` or rebind it.

The `debugging.lua` plugin is not currently working correctly/entirely (maybe if I wasn't trying to test it against docker it would be), that needs more work and I'd like someone to help me who knows more about this kind of stuff.

The `lazygit.lua` plugin is a git gui of sorts. It's supposed to be really good for merge conflicts. Shouls also be handy for some other git commands. I'm not sure if I'll use it in place of the cli or not long term for commiting/pulling/pushing.

The `lsp-config.lua` is configurations for lsp's which are the servives that manage things like code actions, code lenses, etc. This is what allows you to jump to a function or variable definition. You wouldn't want to use a text editor without this today.

The `lualine.lua` plugin is a display at the bottom of the file (can be configured for the top, I'm considering that) that displays things such as the (vim) mode you're in, the git branch, the name of the file, the file type, etc.

The `neo-tree.lua` plugin is a file tree. Built in commands include, but are not limited to:
    * `w` for expanding a directory. This can work on directories if you install another plugin or something.
    * `a` for creating an entry. Append it with `/` to make it a directory.
    * `d` for deleting an entry
    * `r` for renaming an entry
    * `<cr>` for opening an entry.
    * `<space>` for opening an entry.
    * `t` for opening an entry in a new tab.
    * `s` for opening an entry in a vertical split pane.
    * `S` for opening an entry in a horizontal split pane.
    This is a lot, go [here](https://github.com/nvim-neo-tree/neo-tree.nvim#:~:text=%3D%20true%2C%0A%20%20%20%20%20%20%20%20%20%20%7D%2C-,mappings,-%3D%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%5B%22) to see more. 

The `none-ls.lua` plugin is similar to the `lsp-config.lua` except it's configured for eslint and prettier. I believe it's working but the output of `:checkhealth` has me second guessing this. I'll have to look into it some more. `<space>fg` will format your current file.

The `oil.lua` plugin allows you to work in a file directory as if it is a a normal buffer.

The `surround.lua` plugin which makes it easier to surround text with different characters. See the plugin's [README.md](init.lua) for the motions.

The `telescope.lua` plugin is for searching for and through files. use `ctrl+p` to search for a file and `<space>gf` will fuzzy search your files.
    When opening files from telescope you can use `<C-v>` and `<C-x>` to open them in vertical and horizontal split panes respectively.
    Split panes are considered "different windows" for the purpose of `:q`, however the buffer will remain open. you will also be able to cycle through all open tabs in the split pane, play around with it.

The `treesitter.lua` plugin basically syntax highlighting.

The `vim-test.lua` plugin helps run testing. It makes it really easy to run unit and integration tests with a couple of key presses. I want to see if another plugin can work with our e2e tests, or if we can make this one work.
