local Constant = require("core.constant.lsp")
local ts_ft = Constant.ts_filetypes
local web_ft = Constant.web_filetypes

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
			vim.lsp.config('volar', {
				-- add filetypes for typescript, javascript and vue
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
				init_options = {
					vue = {
						-- disable hybrid mode
						hybridMode = false,
					},
				},
			})
			vim.lsp.config['ts_ls'] = {}
		end
	}
}
