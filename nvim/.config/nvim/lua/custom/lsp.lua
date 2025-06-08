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
		config = function()
			local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
			local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"
			local vue_ts_plugin = vue_ls_path .. "/node_modules/typescript/lib"

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						runtime = { version = 'Lua 5.1' },
						diagnostics = {
							globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							userThirdParty = { os.getenv("HOME") .. ".local/share/lua-addons" },
							checkThirdParty = "Apply"
						},
					},
				},
			})
			vim.lsp.config('vue_ls', {
				-- add filetypes for typescript, javascript and vue
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
				init_options = {
					-- vue = {
					-- disable hybrid mode
					-- hybridMode = false,
					-- },
					typescript = {
						-- tsdk = vim.fn.expand(
						-- 	"~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
						-- ),
						tsdk = vue_ts_plugin,
					},
				},
				before_init = function(params, config)
					local lib_path = vim.fs.find('node_modules/typescript/lib', { path = new_root_dir, upward = true })[1]
					if lib_path then
						config.init_options.typescript.tsdk = lib_path
					end
				end
			})
			-- vim.lsp.config['ts_ls'] = {}
			vim.lsp.config('ts_ls', {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_plugin_path,
							languages = { 'typescript', 'javascript', 'vue' },
						},
					},
				},
				filetypes = {
					'javascript',
					'typescript',
					'vue',
				},
			})
		end
	}
}
