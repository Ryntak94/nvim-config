return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
			)
			vim.keymap.set("n", "<leader>rg", builtin.resume, {})
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local pickContainer = function(opts)
				opts = opts or {}
				local containers = vim.split(vim.api.nvim_exec("!docker ps --format '{{.Names}}'", true), "\n")
				table.remove(containers, 1)
				table.remove(containers, 1)
				print(vim.inspect(containers))
				containers[#containers + 1] = "None"
				pickers
					.new(opts, {
						prompt_title = "Containers",
						finder = finders.new_table({
							results = containers,
						}),
						sorter = conf.generic_sorter(opts),
						attach_mappings = function(prompt_bufnr, map)
							actions.select_default:replace(function()
								actions.close(prompt_bufnr)
								local selection = action_state.get_selected_entry()
								if selection[1] == "None" then
									selection[1] = nil
								end
								vim.g.containerToTestAgainst = selection[1]
							end)
							return true
						end,
					})
					:find()
			end
			vim.keymap.set("n", "<leader>pc", pickContainer, {})
			-- to execute the function
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("live_grep_args")
		end,
	},
}
