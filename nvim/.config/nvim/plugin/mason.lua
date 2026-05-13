local group = vim.api.nvim_create_augroup("LspLazyLoad", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = group,
	once = true,
	callback = function()
		-- 1. Download/Register
		vim.pack.add({
			"https://github.com/mason-org/mason.nvim",
			"https://github.com/stevearc/dressing.nvim",
			"https://github.com/mason-org/mason-lspconfig.nvim",
			"https://github.com/neovim/nvim-lspconfig",
		})

		-- 2. Add to runtime path
		vim.cmd("packadd mason.nvim")
		vim.cmd("packadd nvim-lspconfig")
		vim.cmd("packadd mason-lspconfig.nvim")

		-- 3. Defer the setup by one tick to ensure modules are ready
		vim.schedule(function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			-- local lspconfig = require('lspconfig')

			mason.setup({
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
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"stylua",
				},
				automatic_enable = true,
			})
		end)
	end,
})
