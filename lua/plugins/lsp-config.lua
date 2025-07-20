return {
   {
      "mason-org/mason.nvim",
      cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("mason").setup({
            ensure_installed = {
               "goimports",
               "gofumpt",
               "gomodifytags",
               "impl",
               "snyk-ls",
               "shellharden",
               "editorconfig-checker",
               "stylua",
               "buildifier",
            },
         })
      end,
   },
   {
      "mason-org/mason-lspconfig.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = { "mason-org/mason.nvim" },
      opts = { auto_install = true },
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = {
               "angularls",
               "bashls",
               "bazelrc_lsp",
               "bzl",
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
      event = { "BufReadPre", "BufNewFile" },
      dependencies = { "mason-org/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
      config = function()
         local lspconfig = require("lspconfig")
         local capabilities = require("cmp_nvim_lsp").default_capabilities()

         -- PHP LSP setup
         lspconfig.intelephense.setup({
            capabilities = capabilities,
            init_options = { clearCache = true },
            settings = { intelephense = { files = { maxSize = 5000000 } } },
         })

         -- Angular LSP setup
         local ok = pcall(require, "mason-registry")
         if ok then
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
               on_new_config = function(new_config)
                  new_config.cmd = cmd
               end,
               capabilities = capabilities,
            })
         end

         local openInVSCode = function()
            local bufName = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
            vim.cmd("!code " .. bufName)
         end
         vim.keymap.set("n", "<leader>ov", openInVSCode, {})

         -- WebApp specific PHP file handling
         if string.match(vim.fn.getcwd(), "(webApp)") ~= nil then
            vim.api.nvim_create_autocmd("BufAdd", {
               callback = function(params)
                  if string.sub(params.file, string.len(params.file) - 2, string.len(params.file)) ~= "php" then
                     return
                  end
                  ---@diagnostic disable-next-line: redefined-local
                  local ok, stats = pcall(vim.loop.fs_stat, params.file)
                  if ok and stats ~= nil and stats.size > 990000 then
                     vim.cmd("!code " .. params.file)
                  end
               end,
            })
         end
      end,
   },
}
