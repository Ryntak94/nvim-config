return {
   "nvimtools/none-ls.nvim",
   event = { "BufReadPre", "BufNewFile" },
   dependencies = { "nvimtools/none-ls-extras.nvim" },
   config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
         sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.formatting.gofumpt,
            null_ls.builtins.formatting.shellharden,
            null_ls.builtins.code_actions.impl,
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.gomodifytags,
            null_ls.builtins.diagnostics.editorconfig_checker,
            null_ls.builtins.formatting.buildifier,
            null_ls.builtins.diagnostics.buildifier,
         },
      })
   end,
}
