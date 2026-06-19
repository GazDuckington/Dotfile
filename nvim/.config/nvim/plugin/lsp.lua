vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf
		local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

		if client then
			if filetype == "vue" and client.name == "ts_ls" then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		if client and client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						id = client.id,
						timeout_ms = 5000,
						filter = function(c)
							return c.name ~= "ts_ls"
						end,
					})
				end,
			})
		end
	end,
})

-- lsp configs
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
			},
			workspace = {
				library = {
					vim.api.nvim_get_runtime_file("", true),
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					"${3rd}/luv/library",
					-- '${3rd}/busted/library'
				},
				userThirdParty = { os.getenv("HOME") .. ".local/share/LLS-Addons/addons" },
				checkThirdParty = "Apply",
			},
		},
	},
})

local ts_ft = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
	"vue",
}
local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server/node_modules/"
local vue_ts_plugin = vue_ls_path .. "/node_modules/typescript/lib"
vim.lsp.config("vue_ls", {
	-- add filetypes for typescript, javascript and vue
	filetypes = ts_ft, --{ 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
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
		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
		if lib_path then
			config.init_options.typescript.tsdk = lib_path
		end
	end,
})
-- vim.lsp.config['ts_ls'] = {}
vim.lsp.config("ts_ls", {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_plugin_path,
				languages = ts_ft, -- { 'typescript', 'javascript', 'vue' },
			},
		},
	},
	filetypes = ts_ft,
})
