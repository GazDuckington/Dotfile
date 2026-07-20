vim.pack.use("gitsigns.nvim", function()
	require("gitsigns").setup({
	current_line_blame = false,
	current_line_blame_opts = {
		delay = 0,
	},
	})
end)
