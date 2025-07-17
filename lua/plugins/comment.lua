return {
    'numToStr/Comment.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        -- add any options here
    },
    config = function ()
      require("Comment").setup()
    end
}
