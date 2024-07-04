return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bash",
				"diff",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"html",
				"javascript",
				"lua",
				"regex",
				"typescript",
				"vimdoc",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
