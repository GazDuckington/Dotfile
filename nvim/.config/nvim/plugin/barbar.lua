vim.pack.add({
	"https://github.com/romgrk/barbar.nvim",
})

require("barbar").setup({
auto_hide = true,
			icons = {
				button = '󰅙'
			}
})
