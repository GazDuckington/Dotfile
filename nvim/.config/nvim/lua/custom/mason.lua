local Constant = require("core.constant.lsp")
local must_install = Constant.must_install
local ts_ft = Constant.ts_filetypes
local web_ft = Constant.web_filetypes
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
		opts = {
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
		opts = {
			ensure_installed = must_install,
			automatic_installation = true,
			handlers = {
				function(server)
					require('lspconfig')[server].setup({})
				end,
				volar = function()
					require('lspconfig').volar.setup({
						filetypes = ts_ft,
						-- init_options = {
						-- 	vue = {
						-- 		hybridMode = false,
						-- 	},
						-- },
					})
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
									languages = { 'vue' },
								},
							}
						},
						filetypes = ts_ft,
					})
				end,
				emmet_ls = function()
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					require('lspconfig').emmet_ls.setup({
						capabilities = capabilities,
						filetypes = web_ft,
						init_options = {
							html = {
								options = {
									["bem.enabled"] = true,
								},
							},
						}
					})
				end,
			}
		}
	},
}
