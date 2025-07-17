return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	keys = {
		{ "<leader>t", desc = "Test nearest" },
		{ "<leader>T", desc = "Test file" },
		{ "<leader>a", desc = "Test suite" },
		{ "<leader>lt", desc = "Test last" },
		{ "<leader>lv", desc = "Test visit" },
	},
	config = function()
		vim.cmd([[
    function! DockerTransform(cmd) abort
      let container = luaeval("vim.inspect(vim.g.containerToTestAgainst)")

      if strchars(container) && container != "nil"
        let command = "docker exec " . container . " ".a:cmd
        return command
      end
      return "".a:cmd
    endfunction
    let g:test#runner_commands = ["Jest"]
    let test#javascript#jest#options =  {
    \ 'all': '--colors',
    \ 'suite': '--all',
    \ }
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
