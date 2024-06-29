This is my own personal nvim configuration. I'll walk you through the different pieces.

This largely comes from the [youtube series](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) by typecraft, with a few modifications of my own.

The `init.lua` file here at the root simply loads the options from the `lua/vim-options.lua` file, and then the lazy plugin manager which is configured in `lua/config/lazy.lua`

The `vim-options` file sets a few options. Some basic key bindings, relative linen numbers, turns off swap files (a system for preventing the same file open in two places from being overwritten on accident), and some general text formatting options.

The `lazy.lua` file in the plugin directory configures the lazy plugin manager, as well as the mapleader whic by default is the space key. Whenever you see `<leader>` this is what it's referring to. Lazy will automatically load all of the plugins in the plugin folder.

The `alpha-dashboard.lua` plugin is just the dashboard displayed when you open nvim.

The `autopair.lua` plugin is used for automatically generating closing quotes and brackets.

The `catpuccin.lua` plugin is a colorscheme. This will not work in Mac's Terminal.app

The `completions.lua` plugin is configured for autocompletion and snippets for lua and javascript.

The `debugging.lua` plugin is not currently working correctly/entirely (maybe if I wasn't trying to test it against docker it would be), that needs more work and I'd like someone to help me who knows more about this kind of stuff.

The `lazygit.lua` plugin is a git gui of sorts. It's supposed to be really good for merge conflicts. Shouls also be handy for some other git commands. I'm not sure if I'll use it in place of the cli or not long term for commiting/pulling/pushing.

The `lsp-config.lua` is configurations for lsp's which are the servives that manage things like code actions, code lenses, etc. This is what allows you to jump to a function or variable definition. You wouldn't want to use a text editor without this today.

The `lualine.lua` plugin is a display at the bottom of the file (can be configured for the top, I'm considering that) that displays things such as the (vim) mode you're in, the git branch, the name of the file, the file type, etc.

The `neo-tree.lua` plugin is a file tree. `<space>fg` will format your file

The `none-ls.lua` plugin is similar to the `lsp-config.lua` except it's configured for eslint and prettier. I believe it's working but the output of `:checkhealth` has me second guessing this. I'll have to look into it some more.

The `surround.lua` plugin which makes it easier to surround text with different characters. See the plugin's [README.md](init.lua) for the motions.

The `telescope.lua` plugin is for searching for and through files. use `ctrl+p` to search for a file and `<space>gf` will fuzzy search your files

The `treesitter.lua` plugin basically syntax highlighting.


