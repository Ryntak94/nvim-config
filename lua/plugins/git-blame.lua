return {
	"f-person/git-blame.nvim",
	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return vim.fn.isdirectory(".git") == 1
	end,
	config = function()
		require("gitblame").setup({
			enabled = true,
		})
	end,
}
