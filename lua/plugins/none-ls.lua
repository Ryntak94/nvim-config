return {
   "nvimtools/none-ls.nvim",
   dependencies = {
      "nvimtools/none-ls-extras.nvim",
   },
   config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
         sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.prettierd.with({
               extra_filetypes = { "php" },
               env = {
                  PRETTIER_LOCAL_PRETTIER_ONLY = 1,
               },
               -- runtime_condition = function(params)
               -- 	local uri = params.lsp_params.textDocument.uri
               -- 	return string.match(uri, "(monorepo)") == nil
               -- end,
            }),
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.formatting.gofumpt,
            null_ls.builtins.code_actions.impl,
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.gomodifytags,
            null_ls.builtins.diagnostics.editorconfig_checker,
         },
      })
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
         command = "lua=vim.lsp.buf.format({timeout_ms = 15000})",
      })

      local formatWith15sTimeout = function()
         vim.lsp.buf.format({ timeout_ms = 15000 })
      end

      vim.keymap.set("n", "<leader>gf", formatWith15sTimeout, {})
   end,
}
