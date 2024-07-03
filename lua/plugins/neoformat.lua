return {
	"sbdchd/neoformat",
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			command = ":Neoformat",
		})
	end,
}
