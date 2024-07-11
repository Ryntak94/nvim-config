return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			scope = {
				show_start = true,
				show_end = true,
			},
		})
	end,
}
