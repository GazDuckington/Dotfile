vim.pack.use("nvim-surround", function()
	require("nvim-surround").setup()
end)

vim.pack.use("boole.nvim", function()
	require("boole").setup({
		mappings = {
			increment = "t",
			decrement = "T",
		},
	})
end)

vim.pack.use("nvim-ts-context-commentstring")
vim.pack.use("Comment.nvim", function()
	require("Comment").setup({
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		toggler = { line = "<C-c>" },
		opleader = { line = "<C-c>" },
	})
end)

vim.pack.use("nvim-spider", function()
	require("spider").setup({
		skipInsignificantPunctuation = false,
		subwordMovement = true,
		customPatterns = {},
	})
end)

vim.pack.use("promise-async")
vim.pack.use("nvim-ufo", function()
	require("ufo").setup({
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	})
end)
vim.pack.use("ultimate-autopair.nvim", function()
	require("ultimate-autopair").setup({})
end)

vim.pack.use("nvim-ts-autotag", function()
	require("nvim-ts-autotag").setup({
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = false,
		},
	})
end)

vim.pack.use("todo-comments.nvim", function()
	require("todo-comments").setup()
end)
