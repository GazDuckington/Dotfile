vim.pack.add({"https://github.com/catgoose/nvim-colorizer.lua"})
require("colorizer").setup({
filetypes = {
				"*",
			},
			user_default_options = {
				rgb_fn = true,
				tailwind = 'both', -- Enable tailwind colors
				tailwind_opts = { -- Options for highlighting tailwind names
					update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
				},
			}
})
