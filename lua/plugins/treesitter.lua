return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
    ensure_installed = {"lua", "javascript"},
    highlight = { enabled = true },
    indent = { enabled = true }
  })
end
}
