return {
   "nvim-treesitter/nvim-treesitter",
   event = { "BufReadPost", "BufNewFile" },
   build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
   end,
   config = function()
      local config = require("nvim-treesitter.configs")
      ---@diagnostic disable-next-line: missing-fields
      config.setup({
         ensure_installed = {
            "angular",
            "bash",
            "diff",
            "go",
            "gomod",
            "gosum",
            "gowork",
            "html",
            "javascript",
            "json",
            "jsonnet",
            "lua",
            "php",
            "proto",
            "regex",
            "tsx",
            "typescript",
            "vimdoc",
         },
         highlight = { enable = true },
         indent = { enable = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
         pattern = "htmlangular",
         callback = function(args)
            vim.treesitter.start(args.buf, "angular")
            vim.bo[args.buf].syntax = "on"
         end,
      })
   end,
}
