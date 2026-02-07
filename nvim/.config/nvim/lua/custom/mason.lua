local Constant = require("core.constant.lsp")
local must_install = Constant.must_install
local ts_ft = Constant.ts_filetypes
local web_ft = Constant.web_filetypes
return {
	{
		'mason-org/mason.nvim',
		dependencies = {
			{
				'stevearc/dressing.nvim',
				opts = {},
				event = 'VeryLazy'
			}
		},
		opts = {
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
			ui = {
				border = "rounded",
				icons = {
					package_installed = "◍",
					package_pending = "◍",
					package_uninstalled = "◍",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
		}
	},
}
