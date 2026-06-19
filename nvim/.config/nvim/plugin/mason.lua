vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("LspLazyLoad", { clear = true }),
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/mason-org/mason.nvim",
			"https://github.com/mason-org/mason-lspconfig.nvim",
			"https://github.com/neovim/nvim-lspconfig",
		})
		vim.cmd("packadd mason.nvim")
		vim.cmd("packadd nvim-lspconfig")
		vim.cmd("packadd mason-lspconfig.nvim")

		vim.schedule(function()
			require("mason").setup({
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
			})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "stylua" },
				automatic_enable = true,
			})
		end)
	end,
})
