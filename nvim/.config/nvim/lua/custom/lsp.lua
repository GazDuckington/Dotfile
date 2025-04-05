local Constant = require("core.constant.lsp")
local ts_ft = Constant.ts_filetypes

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		opts = {
			servers = {
				-- Lua LSP
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								userThirdParty = { os.getenv("HOME") .. ".local/share/lua-addons" },
								checkThirdParty = "Apply"
							},
						},
					},
				},

				-- HTML LSP
				-- html = {
				-- },
			}
		},

		config = function(_, opts)
			local lspconfig = require('lspconfig')
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			for server, config in pairs(opts.servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end
			lspconfig.html.setup({
				capabilities = capabilities,
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true
				},
				filetypes = { "html" }, -- Make sure it's applied to HTML
				settings = {},
				single_file_support = true
			})

			local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
			local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_plugin_path,
							languages = { 'vue' },
						},
					}
				},
				filetypes = ts_ft,
			})
		end
	}
}
