This is my own personal nvim configuration. I'll walk you through the different pieces.

This largely comes from the [youtube series](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) by typecraft, with a few modifications of my own.

The `init.lua` file here at the root simply loads the options from the `lua/vim-options.lua` file, and then the lazy plugin manager which is configured in `lua/config/lazy.lua`

The `vim-options.lua` file sets a few options. Some basic key bindings, relative line numbers, turns off swap files (a system for preventing the same file open in two places from being overwritten on accident), some general text formatting options, keymaps for jumping between panes for a tmux integration, and turning off left over highlights from the `/` searches. Additionally, I'm currently working on a language server currently and those connection settings are here. If you're helping, adjust the path to the executable. If you're not, feel free to delete the block that looks like the following:

```
local client = vim.lsp.start_client({
	name = "go-lsp",
	cmd = { "./main" },
	cmd_cwd = "/Users/ryan/Work/go-lsp/bin",
})

if not client then
	vim.notify("hey, you didn't do the client thing good")
	return
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
```

The `lazy.lua` file in the plugin directory configures the lazy plugin manager, as well as the mapleader which by default is the space key. Whenever you see `<leader>` this is what it's referring to. Lazy will automatically load all of the plugins in the plugin folder.

The `alpha-dashboard.lua` plugin is just the dashboard displayed when you open nvim.

The `autopair.lua` plugin is used for automatically generating closing quotes and brackets. It also includes `autotag` which is basically the same thing for `HTML` elements.

The `catpuccin.lua` plugin is a colorscheme. It also turns on integrations for other plugins that I have that aren't on by default.

The `barbar.lua` plugin is for tabs. I've created a few useful mappings. A couple things to note: `:q` doesn't close a buffer/tab. It closes a window. If you are in a tab and want to close it, `:q` will likely close more than the tab you are viewing. Use `<leader>bc` or rebind it. Additionally, I'm stupid and set `gitsigns` up here. This gives you indications about line changes. There are other uses but that's what I'm familiar with.

The `comment.lua` file gives support for commenting out lines easily/quickly.

The `completions.lua` plugin is configured for autocompletion and snippets for lua and javascript.

The `debugging.lua` is currently setup to work with Node.js only. You can pick a docker container where your process is running with `<leader>pc` and then you can turn it on with `<leader>db` setting a breakpoint and `<leader>dc`, then pick `Attack to Docker` or similar. To make this work you will need to follow the docs [here](https://github.com/microsoft/vscode-js-debug) and put the vscode-js-debug folder inside of the utils folder at the root of the nvim config.

The `diffview.lua` plugin is a nicer git diff viewer.

The `git-blame.lua` adds the commit message of the current line, as well as a few other hotkeys.

The `hardtime.lua` plugin helps you form better git habits by stopping repetitve motions and telling you a more efficient way to do something.

The `hop.lua` plugin is for faster navigation in a file. Press `f<character to jump to>`. If the character turns red, press the character it turned into. If it turned blue, press that and the following character to jump to it. `F` is similar but in the reverse direction.

The `illuminate.lua` plugin highlights other uses of the same word.

The `indent-blank-line.lua` plugin gives extra indention highlighting for the block you're in.

The `lsp-config.lua` is configurations for lsp's which are the servives that manage things like code actions, code lenses, etc. This is what allows you to jump to a function or variable definition. You wouldn't want to use a text editor without this today. Also works with treesitter for syntax highlighting.

The `lualine.lua` plugin is a display at the bottom of the file (can be configured for the top, I'm considering that) that displays things such as the (vim) mode you're in, the git branch, the name of the file, the file type, etc.

The `neo-tree.lua` plugin is a file tree. Built in commands include, but are not limited to:
_ `w` for expanding a directory. This can work on directories if you install another plugin or something.
_ `a` for creating an entry. Append it with `/` to make it a directory.
_ `d` for deleting an entry
_ `r` for renaming an entry
_ `<cr>` for opening an entry.
_ `<space>` for opening an entry.
_ `t` for opening an entry in a new tab.
_ `s` for opening an entry in a vertical split pane. \* `S` for opening an entry in a horizontal split pane.
This is a lot, go [here](https://github.com/nvim-neo-tree/neo-tree.nvim#:~:text=%3D%20true%2C%0A%20%20%20%20%20%20%20%20%20%20%7D%2C-,mappings,-%3D%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%5B%22) to see more.

The `none-ls.lua` plugin is similar to the `lsp-config.lua` except it's configured for formatting, diagnostic, and code_action tools.

The `nvim-bqf.lua` plugin is for better quick fix lists. Currently I'm just using it for previews in my quick fix lists.

The `oil.lua` plugin allows you to work in a file directory as if it is a a normal buffer.

The `surround.lua` plugin which makes it easier to surround text with different characters. See the plugin's [README.md](init.lua) for the motions.

The `telescope.lua` plugin is for searching for and through files. use `ctrl+p` to search for a file and `<space>gf` will fuzzy search your files.
When opening files from telescope you can use `<C-v>` and `<C-x>` to open them in vertical and horizontal split panes respectively.
Split panes are considered "different windows" for the purpose of `:q`, however the buffer will remain open. you will also be able to cycle through all open tabs in the split pane, play around with it. You can also move your results into a quickfix list using `<C-q>`. The `<leader>pc` motion extends telescope, as well. Lastly, I've replaced the native telescope `live grep` with `live grep with args` which utilizes ripgrep. Please see the docs for each for more information. [live grep with args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim), [ripgrep](https://github.com/BurntSushi/ripgrep)

The `tmux-navigator` is to help with tmux pane navigation.

The `treesitter.lua` plugin basically syntax highlighting. To utilize the `angular` syntax highlighting, you must be on the nightly build of neovim or version 0.11 which isn't due for release until October 11, 2024.

The `trouble.lua` plugin is for help with navigating erros. It's kind of like a quickfix list. The most importan motion is `<leader>xx`.

The `vim-test.lua` plugin helps run testing. It makes it really easy to run unit and integration tests with a couple of key presses. I want to see if another plugin can work with our e2e tests, or if we can make this one work. Additionally, it's currently setup to work with vimux to open a window in a separate pane.
