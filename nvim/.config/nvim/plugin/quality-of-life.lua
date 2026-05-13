local group = vim.api.nvim_create_augroup("LazyLoadPlugins", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "InsertEnter" }, {
	group = group,
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/kylechui/nvim-surround" })
		vim.cmd("packadd nvim-surround")
		require("nvim-surround").setup()
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/nat-418/boole.nvim" })
		vim.cmd("packadd boole.nvim")
		require("boole").setup({
			mappings = {
				increment = "t",
				decrement = "T",
			},
		})
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/numToStr/Comment.nvim",
			"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
		})
		-- Load both to ensure the context integration works
		vim.cmd("packadd nvim-ts-context-commentstring")
		vim.cmd("packadd Comment.nvim")

		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			toggler = { line = "<C-c>" },
			opleader = { line = "<C-c>" },
		})
	end,
})

vim.pack.add({ "https://github.com/chrisgrieser/nvim-spider" })
require("spider").setup({
	skipInsignificantPunctuation = false,
	subwordMovement = true,
	customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = group, -- Using your existing group
	once = true,
	callback = function()
		-- 1. Download/Register the new plugins
		vim.pack.add({
			"https://github.com/kevinhwang91/nvim-ufo",
			"https://github.com/kevinhwang91/promise-async",
			"https://github.com/altermo/ultimate-autopair.nvim",
		})

		-- 2. Load the plugins into the runtime
		vim.cmd("packadd nvim-ufo")
		vim.cmd("packadd promise-async")
		-- Note: ultimate-autopair usually wants to wait for InsertEnter
		-- but we can packadd it now and setup the trigger later
		vim.cmd("packadd ultimate-autopair.nvim")

		-- 3. Configure ufo
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})

		-- 4. Configure ultimate-autopair
		require("ultimate-autopair").setup({
			-- Config goes here
		})
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = group,
	once = true,
	callback = function()
		-- 1. Register the plugin
		vim.pack.add({ "https://github.com/windwp/nvim-ts-autotag" })

		-- 2. Add to runtime path
		vim.cmd("packadd nvim-ts-autotag")

		-- 3. Configure
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
		})
	end,
})
