return {
   "nvim-lualine/lualine.nvim",
   event = "VimEnter",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      local lualine = require("lualine")

      lualine.setup({
         options = {
            theme = "tokyonight",
         },
         sections = {
            lualine_b = { "branch", "diff", "diagnostics" },
         },
      })
   end,
}
