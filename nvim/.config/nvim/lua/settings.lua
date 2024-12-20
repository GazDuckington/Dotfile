local M = {}
M.setup = function()
	require("core/command").setup()
	require("core/autocommand").setup()
	require("core/keybinding").setup()
	vim.cmd.set("clipboard+=unnamedplus")
	vim.g.mapleader        = " "
	vim.g.web_ft           = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte",
		"pug", "typescriptreact", "vue" }
	vim.opt_global.shell   = "fish"
	vim.opt.undofile       = true
	vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
	vim.opt.termguicolors  = true
	vim.opt.cursorline     = true
	vim.opt.tabstop        = 2
	vim.opt.softtabstop    = 2
	vim.opt.shiftwidth     = 2
	vim.opt.smartindent    = true
	vim.opt.foldcolumn     = '0'
	vim.opt.foldlevel      = 99
	vim.opt.foldlevelstart = 99
	vim.opt.foldenable     = true
end
return M
