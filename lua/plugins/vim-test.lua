return {
	"vim-test/vim-test",
	config = function()
		vim.cmd([[
    function! DockerTransform(cmd) abort
      if stridx(execute("pwd"), "flannel") != -1
        echom "contains flannel"
        return "docker exec flannel-dev ".a:cmd
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
	end,
}
