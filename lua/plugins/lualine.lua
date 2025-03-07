return {
   "nvim-lualine/lualine.nvim",
   config = function()
      local lualine = require("lualine")
      getCodeOwner = function()
         local buff = vim.api.nvim_buf_get_name(0)
         local val = vim.split(
            vim.api.nvim_exec(
               "!gitRoot=$(git rev-parse --show-toplevel) && subPath=$(echo "
               .. buff
               ..
               ' | sed \'s,\'"$gitRoot"\',,\' | grep -Eo "[a-zA-Z0-9]+/[a-zA-Z0-9]+/[a-zA-Z0-9]+") && cat "$gitRoot/CODEOWNERS" | grep "$subPath" | awk \'{ print $2 }\'',
               true
            ),
            "\n"
         )
         local owner = table.remove(val, 3)
         if string.sub(owner, 1, 1) == "@" then
            return owner
         end
         return ""
      end
      local codeOwner = getCodeOwner()
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
         callback = function()
            codeOwner = getCodeOwner()
         end,
      })
      local function displayCodeOwner()
         return codeOwner
      end
      lualine.setup({
         options = {
            theme = "dracula",
         },
         sections = {
            lualine_b = { "branch", "diff", "diagnostics", displayCodeOwner },
         },
      })
   end,
}
