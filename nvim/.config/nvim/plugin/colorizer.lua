vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
vim.cmd("packadd nvim-colorizer.lua")
require("colorizer").setup({
	filetypes = { "*" },
	user_default_options = {
		rgb_fn = true,
		tailwind = "both",
		tailwind_opts = {
			update_names = true,
		},
	},
})
