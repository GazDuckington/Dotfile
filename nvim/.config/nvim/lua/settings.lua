-- local Constant = require("core.constant.lsp")
local M = {}

M.setup = function()
	require("core.command").setup()
	require("core.autocommand").setup()
	require("core.keybinding").setup()
	require("core.options").setup()
	vim.g.mapleader = " "
	-- vim.g.web_ft    = Constant.web_filetypes
	-- vim.opt_global.shell   = "fish"
	-- vim.opt.clipboard:append("unnamedplus")
	-- vim.opt.undofile       = true
	-- vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
	-- vim.opt.termguicolors  = true
	-- vim.opt.cursorline     = true
	-- vim.opt.tabstop        = 2
	-- vim.opt.softtabstop    = 2
	-- vim.opt.shiftwidth     = 2
	-- vim.opt.smartindent    = true
	-- vim.opt.foldcolumn     = '0'
	-- vim.opt.foldlevel      = 99
	-- vim.opt.foldlevelstart = 99
	-- vim.opt.foldenable     = true
	-- vim.opt.laststatus     = 2
	-- vim.opt.number         = true
	-- vim.opt.relativenumber = true
end
return M
