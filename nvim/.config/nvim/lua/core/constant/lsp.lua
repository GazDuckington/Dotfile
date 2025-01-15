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
	"eruby",
	"html",
	"javascript",
	"javascriptreact",
	"less",
	"sass",
	"scss",
	"svelte",
	"pug",
	"typescriptreact",
	"vue"
}

return M
