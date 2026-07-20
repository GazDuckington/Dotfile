vim.pack.use("nvim-colorizer.lua", function()
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
end)
