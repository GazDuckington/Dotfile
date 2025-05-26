-- local client_capabilities = vim.lsp.protocol.make_client_capabilities()
-- local Constant = require("core.constant.lsp")
-- local ts_ft = Constant.ts_filetypes
-- local web_ft = Constant.web_filetypes

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
			}
		},

		config = function(_, opts)
			local lspconfig = require('lspconfig')
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			for server, config in pairs(opts.servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end

			vim.lsp.config('vue_ls', {
				-- add filetypes for typescript, javascript and vue
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
				init_options = {
					vue = {
						-- disable hybrid mode
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.expand(
							"~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
						),
					},
				},
			})
			vim.lsp.config['ts_ls'] = {}
		end
	}
}
