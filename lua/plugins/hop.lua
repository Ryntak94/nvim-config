return {
	"phaazon/hop.nvim",
	branch = "v2",
	keys = {
		{ "f", desc = "Hop forward" },
		{ "F", desc = "Hop backward" },
	},
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
		local directions = require("hop.hint").HintDirection
		vim.keymap.set("", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end, { remap = true })

		vim.keymap.set("", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
		end, { remap = true })
	end,
}
