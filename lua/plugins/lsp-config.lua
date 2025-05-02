return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = { "goimports", "gofumpt", "gomodifytags", "impl", "snyk-ls" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"angularls",
					"lua_ls",
					"ts_ls",
					"intelephense",
					"html",
					"gopls",
					"jsonnet_ls",
					"eslint",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_depphpactorendency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
			},
			setup = {
				---@diagnostic disable-next-line: unused-local
				gopls = function(_, opts)
					-- workaround for gopls not supporting semanticTokensProvider
					-- https://github.com/golang/go/issues/54531#issuecomment-1464982242
					vim.lsp.on_attach(function(client, _)
						if not client.server_capabilities.semanticTokensProvider then
							local semantic = client.config.capabilities.textDocument.semanticTokens
							client.server_capabilities.semanticTokensProvider = {
								full = true,
								legend = {
									tokenTypes = semantic.tokenTypes,
									tokenModifiers = semantic.tokenModifiers,
								},
								range = true,
							}
						end
					end, "gopls")
					-- end workaround
				end,
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				init_options = {
					clearCache = true,
				},
				settings = {
					intelephense = {
						files = {
							maxSize = 5000000,
						},
					},
				},
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonnet_ls.setup({
				capabilities = capabilities,
			})
			local ok, mason_registry = pcall(require, "mason-registry")
			if not ok then
				vim.notify("mason-registry could not be loaded")
				return
			end

			local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

			local cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				vim.uv.cwd() .. "/node_modules/typescript/lib",
				"--ngProbeLocations",
				"/Users/ryan/.nvm/versions/node/v18.20.3/lib/node_modules/@angular/language-server",
			}

			lspconfig.angularls.setup({
				cmd = cmd,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = cmd
				end,
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			vim.diagnostic.config({ virtual_text = false })
			local floatError = function()
				vim.diagnostic.open_float()
			end
			vim.keymap.set("n", "ge", floatError)
			vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			local openInVSCode = function()
				local bufName = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
				vim.cmd("!code " .. bufName)
			end
			vim.keymap.set("n", "<leader>ov", openInVSCode, {})

			if string.match(vim.fn.getcwd(), "(webApp)") ~= nil then
				vim.api.nvim_create_autocmd("BufAdd", {
					callback = function(params)
						if string.sub(params.file, string.len(params.file) - 2, string.len(params.file)) ~= "php" then
							return
						end
						local ok, stats = pcall(vim.loop.fs_stat, params.file)
						if ok and stats.size > 990000 then
							vim.cmd("!code " .. params.file)
						end
					end,
				})
			end
		end,
	},
}
