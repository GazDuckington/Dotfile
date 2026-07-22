vim.pack.use("nvim-treesitter")

require("nvim-treesitter").install({
	"python",
	"lua",
	"vim",
	"vimdoc",
	"javascript",
	"typescript",
	"html",
	"css",
	"json",
	"yaml",
	"toml",
	"markdown",
	"markdown_inline",
	"c",
	"cpp",
	"rust",
	"go",
	"sql",
	"bash",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local ok = pcall(vim.treesitter.start, ev.buf)
		if not ok then
			vim.bo[ev.buf].syntax = "ON"
		end
	end,
})
