return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.cmd([[
    function! DockerTransform(cmd) abort
      let container = luaeval("vim.inspect(vim.g.containerToTestAgainst)")

      if strchars(container) && container != "nil"
        let command = "docker exec " . container . " ".a:cmd
        return command
      end
        echom "does not contain flannel"
      return "".a:cmd
    endfunction
    let g:test#custom_transformations = {"docker": function("DockerTransform")}
    let g:test#transformation = "docker"
  ]])
		vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
		vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
		vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")
		vim.keymap.set("n", "<leader>lt", ":TestLast<CR>")
		vim.keymap.set("n", "<leader>lv", ":TestVisit<CR>")
		vim.cmd("let test#strategy = 'vimux'")
		vim.g["VimuxRunnerName"] = "DEDICATED_TESTER"
	end,
}
