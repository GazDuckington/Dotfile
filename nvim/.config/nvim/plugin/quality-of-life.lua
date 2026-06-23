vim.pack.add({ "https://github.com/kylechui/nvim-surround" })
vim.cmd("packadd nvim-surround")
require("nvim-surround").setup()

vim.pack.add({ "https://github.com/nat-418/boole.nvim" })
vim.cmd("packadd boole.nvim")
require("boole").setup({
	mappings = {
		increment = "t",
		decrement = "T",
	},
})

vim.pack.add({
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
})
vim.cmd("packadd nvim-ts-context-commentstring")
vim.cmd("packadd Comment.nvim")
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	toggler = { line = "<C-c>" },
	opleader = { line = "<C-c>" },
})

vim.pack.add({ "https://github.com/chrisgrieser/nvim-spider" })
vim.cmd("packadd nvim-spider")
require("spider").setup({
	skipInsignificantPunctuation = false,
	subwordMovement = true,
	customPatterns = {},
})

vim.pack.add({
	"https://github.com/kevinhwang91/nvim-ufo",
	"https://github.com/kevinhwang91/promise-async",
	"https://github.com/altermo/ultimate-autopair.nvim",
})
vim.cmd("packadd nvim-ufo")
vim.cmd("packadd promise-async")
vim.cmd("packadd ultimate-autopair.nvim")
require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
require("ultimate-autopair").setup({})

vim.pack.add({ "https://github.com/windwp/nvim-ts-autotag" })
vim.cmd("packadd nvim-ts-autotag")
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
})

vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })
vim.cmd("packadd todo-comments.nvim")
require("todo-comments").setup()
