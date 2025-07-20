return {
   "sindrets/diffview.nvim",
   keys = { { "<leader>dvo", "<cmd>DiffViewOpen<CR>" } },
   config = function()
      require("diffview")
      vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>")
      vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>")
   end,
}
