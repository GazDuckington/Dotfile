local Constant = require("core.constant.lsp")
local ts_ft = Constant.ts_filetypes

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saghen/blink.cmp',
			'williamboman/mason.nvim',
			"williamboman/mason-lspconfig.nvim",
		},

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						},
					},
				},
			}
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			for server, config in pairs(opts.servers) do
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)

				if server == 'emmet_ls' then
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					config = {
						-- on_attach = on_attach,
						capabilities = capabilities,
						filetypes = vim.g.web_ft,
						init_options = {
							html = {
								options = {
									["bem.enabled"] = true,
								},
							},
						}
					}
				end
				lspconfig[server].setup(config)
			end
		end
	}
}
