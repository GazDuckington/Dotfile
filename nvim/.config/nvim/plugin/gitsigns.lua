vim.api.nvim_create_autocmd('BufReadPost', { once = true, callback = function()
  vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"})
	require("gitsigns").setup({
		current_line_blame = false,
		current_line_blame_opts = {
			delay = 0,
		},
	})
end })
