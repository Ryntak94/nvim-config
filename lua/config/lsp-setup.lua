vim.lsp.config["eslint-lsp"] = { settings = { experimental = { useFlatConfig = true } } }
vim.lsp.enable("eslint-lsp")

local rt = vim.api.nvim_get_runtime_file("", true)

vim.lsp.config["lua_ls"] = {
   cmd = { "lua-language-server" },
   single_file_support = false,
   filetypes = { "lua" },
   root_markers = { ".git", ".git/" },
   settings = {
      Lua = {
         runtime = {
            version = "LuaJIT",
         },
         diagnostics = {
            globals = { "vim" },
         },
         workspace = {
            checkThirdParty = false,
            library = rt,
         },
      },
   },
}

vim.lsp.enable("lua_ls")

vim.lsp.enable("ts_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("jsonnet_ls")
vim.lsp.enable("bzl")
vim.lsp.enable("gopls")

-- Diagnostic and keymap configuration
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
         return
      end
      if client:supports_method("textDocument/formatting") or client.name == "eslint" then
         if client.name == "ts_ls" then
            return
         end

         vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
               vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
         })
      end
   end,
})
