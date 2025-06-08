local M = {}

M.must_install = {
	"lua_ls",
	"pyright",
	"gopls",
	"svelte",
	"eslint",
	"tailwindcss",
	"emmet_ls",
	"marksman",
	-- "sourcery",
	"cssls",
	"html",
	"vue_ls",
	"ts_ls",
}

M.ts_filetypes = {
	'javascript',
	'javascriptreact',
	'javascript.jsx',
	'typescript',
	'typescriptreact',
	'typescript.tsx',
	'vue',
}

M.web_filetypes = {
	"css",
	"html",
	"javascript",
	"javascriptreact",
	"less",
	"sass",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"vue"
}

return M
