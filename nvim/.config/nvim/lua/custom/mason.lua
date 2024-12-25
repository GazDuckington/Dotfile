local Constant = require("core.constant.lsp")
local must_install = Constant.must_install
local ts_ft = Constant.ts_filetypes

return {
	{

		'williamboman/mason.nvim',
		dependencies = {
			{
				'stevearc/dressing.nvim',
				opts = {},
				event = 'VeryLazy'
			}
		},
		config = {
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
		"williamboman/mason-lspconfig.nvim",
		config = {
			ensure_installed = must_install,
			automatic_installation = true,
			handlers = {
				function(server)
					require('lspconfig')[server].setup({})
				end,
				volar = function()
					require('lspconfig').volar.setup()
				end,
				ts_ls = function()
					local vue_typescript_plugin = require('mason-registry')
							.get_package('vue-language-server')
							:get_install_path()
							.. '/node_modules/@vue/language-server'
							.. '/node_modules/@vue/typescript-plugin'

					require('lspconfig').ts_ls.setup({
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_typescript_plugin,
									languages = ts_ft,
								},
							}
						},
					})
				end,
			}
		}
	},
}
