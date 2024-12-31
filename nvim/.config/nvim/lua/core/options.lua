local options = {
	shell = "/bin/fish",
	clipboard = "unnamedplus",
	undofile = true,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	termguicolors = true,
	cursorline = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	smartindent = true,
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
	laststatus = 2,
	number = true,
	relativenumber = true,
}

local function setup()
	for key, value in pairs(options) do
		vim.opt[key] = value
	end
end

return {
	setup = setup,
}
