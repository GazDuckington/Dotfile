local M = {}
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

M.setup = function()
	-- quality of life
	-- map("i", "jk", "<ESC>", opts)
	map("n", "P", '"0p', opts)
	map("n", "J", "mzJ`z", opts)
	map("n", "<c-d>", "<C-d>zz", opts)
	map("n", "<c-u>", "<C-u>zz", opts)
	map("n", "n", "nzzzv", opts)
	map("n", "N", "Nzzzv", opts)
	map("n", "<C-a>", "ggVG", opts)
	map("x", "<leader>p", "\"_dP", opts)
	map("i", "<c-o>", "<C-O>o", opts)
	map("v", "<", "<gv", opts)
	map("v", ">", ">gv", opts)

	-- save & quit
	map("i", "<c-s>", "<ESC><cmd>w!<cr>", opts)
	map("n", "<c-s>", "<cmd>w!<cr>", opts)
	map("n", "<c-q>", "<cmd>q!<cr>", opts)

	-- move line up & down
	map("n", "<A-k>", ":m .-2<cr>==", opts)
	map("n", "<A-j>", ":m .+1<cr>==", opts)
	map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
	map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
	map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
	map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

	-- window navigation
	map("n", "<C-h>", "<C-w>h", opts)
	map("n", "<C-j>", "<C-w>j", opts)
	map("n", "<C-k>", "<C-w>k", opts)
	map("n", "<C-l>", "<C-w>l", opts)

	-- buffer controls
	map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
	-- map("n", "<A-w>", "<cmd>BufferClose<cr>", opts)
	map("n", "<A-w>", "<cmd>lua Snacks.bufdelete()<cr>", opts)
	map("n", "<A-h>", "<cmd>BufferPrevious<cr>", opts)
	map("n", "<A-l>", "<cmd>BufferNext<cr>", opts)
	--
	map("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", opts)
	map("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", opts)
	--
	-- magic buffer picking
	map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

	-- goto
	map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	map("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	map("n", "]]", function() Snacks.words.jump(vim.v.count1) end, opts)
	map("n", "[[", function() Snacks.words.jump(-vim.v.count1) end, opts)
	map("n", "]c", ":Gitsigns next_hunk<cr>", opts)
	map("n", "[c", ":Gitsigns prev_hunk<cr>", opts)

	-- movement
	map(
		{ "n", "o", "x" },
		"w",
		"<cmd>lua require('spider').motion('w')<CR>",
		{ desc = "Spider-w" }
	)
	map(
		{ "n", "o", "x" },
		"e",
		"<cmd>lua require('spider').motion('e')<CR>",
		{ desc = "Spider-e" }
	)
	map(
		{ "n", "o", "x" },
		"b",
		"<cmd>lua require('spider').motion('b')<CR>",
		{ desc = "Spider-b" }
	)
end
return M
