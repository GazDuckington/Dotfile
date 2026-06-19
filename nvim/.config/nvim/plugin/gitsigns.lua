vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
vim.cmd("packadd gitsigns.nvim")
require("gitsigns").setup({
	current_line_blame = false,
	current_line_blame_opts = {
		delay = 0,
	},
})
