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
							diagnostics = { globals = { "vim" } }, -- Example Lua LSP settings
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
				lspconfig[server].setup(config)
			end
			--
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			lspconfig.emmet_ls.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				filetypes = vim.g.web_ft,
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				}
			})
		end

		-- example calling setup directly for each LSP
		-- config = function()
		--     local capabilities = require('blink.cmp').get_lsp_capabilities()
		--     local lspconfig = require('lspconfig')

		--     lspconfig['lua-ls'].setup({ capabilities = capabilities })
		-- end
	}
}
