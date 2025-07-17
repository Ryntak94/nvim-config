return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  keys = {
    { "<C-n>", "<CMD>Neotree filesystem reveal left<CR>", desc = "Open Neo-tree" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {});
  end
}
