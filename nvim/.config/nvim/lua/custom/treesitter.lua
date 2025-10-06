local Constant = require("core.constant.lsp")
local must_install = Constant.web_filetypes

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = vim.fn.argc(-1) == 0,
		event = { "VeryLazy" },
		build = ":TSUpdate",
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- Ensure TypeScript parser is used for Svelte files
			vim.treesitter.language.register('typescript', 'svelte')
		end,
		opts = {
			ensure_installed = must_install,
			folds = { enable = true },
			auto_install = {
				enable = true
			},
			highlight = {
				enable = true
			},
			indent = {
				enable = true
			},
		}
	}
}
