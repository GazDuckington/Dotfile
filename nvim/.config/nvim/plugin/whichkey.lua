vim.pack.add({ "https://github.com/folke/which-key.nvim" })
vim.cmd("packadd which-key.nvim")

local wk = require("which-key")
local Snacks = require("snacks")
local mappings = {
	{ "<leader>.", ":cd ~/.config/nvim<cr>:e init.lua<cr>", desc = "Open Neovim Config" },
	{ "<leader>n", ":nohl<cr>", desc = "Reset highlight" },
	{ "<leader>i", "<cmd>cd %:p:h<cr>", desc = "Cd to Buffer" },
	{ "<leader>o", ":e ", desc = "Open/Create File" },
	{ "<leader>c", ":ColorizerToggle<cr>", desc = "Toggle colorizer" },
	{
		"<leader>e",
		function()
			Snacks.picker.explorer()
		end,
		desc = "Open file manager",
	},

	{ "<leader>m", group = "Menu" },
	{
		"<leader>mg",
		function()
			Snacks.lazygit()
		end,
		desc = "LazyGit",
	},
	{ "<leader>ms", ":saveas ", desc = "Save buffer as" },
	{ "<leader>mi", ":LspInfo<cr>", desc = "LSP Info" },
	{ "<leader>mm", ":Mason<cr>", desc = "Mason" },

	{ "<leader>h", group = "Helps" },
	{
		"<leader>hk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "List all keymaps",
	},
	{
		"<leader>hh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Tags",
	},

	{ "<leader>v", group = "Views" },
	{ "<leader>vl", "<cmd>vsplit<cr><C-w>l", desc = "Focus split right" },
	{ "<leader>vj", "<cmd>split<cr><C-w>j", desc = "Focus split down" },

	{ "<leader>q", group = "Quickfix" },
	{ "<leader>qN", ":cprevious<cr>", desc = "Previous" },
	{ "<leader>qo", ":copen<cr>", desc = "Open" },
	{ "<leader>qn", ":cnext<cr>", desc = "Next" },

	{ "<leader>x", group = "Trouble" },
	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Workspace Diagnostics",
	},
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{
		"<leader>xs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		desc = "Symbols (Trouble)",
	},
	{
		"<leader>xl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{
		"<leader>xL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List (Trouble)",
	},
	{
		"<leader>xq",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "QuickFix",
	},

	{ "<leader>t", group = "Git Signs" },
	{ "<leader>ts", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" } },
	{ "<leader>tr", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" } },
	{ "<leader>tS", ":Gitsigns stage_buffer<CR>", mode = "n" },
	{ "<leader>tu", ":Gitsigns undo_stage_hunk<CR>", mode = "n" },
	{ "<leader>tR", ":Gitsigns reset_buffer<CR>", mode = "n" },
	{ "<leader>tp", ":Gitsigns preview_hunk<CR>", mode = "n" },
	{ "<leader>tb", ":Gitsigns blame_line full=true<CR>", mode = "n" },
	{ "<leader>tB", ":Gitsigns toggle_current_line_blame<CR>", mode = "n" },
	{ "<leader>td", ":Gitsigns diffthis<CR>", mode = "n" },
	{ "<leader>tD", ":Gitsigns diffthis ~<CR>", mode = "n" },
	{ "<leader>tt", ":Gitsigns toggle_deleted<CR>", mode = "n" },
	{ "<leader>ti", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" } },

	{ "<leader>b", group = "Buffer Sorting" },
	{ "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", desc = "Order By Number" },
	{ "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", desc = "Order By Directory" },
	{ "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", desc = "Order By Language" },
	{ "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", desc = "Order By Window Number" },

	{ "<leader>z", group = "Snacks Mode" },
	{
		"<leader>zz",
		function()
			Snacks.toggle.zen():toggle()
		end,
		desc = "Zen Mode",
	},
	{
		"<leader>zd",
		function()
			Snacks.toggle.dim():toggle()
		end,
		desc = "Dim Mode",
	},
	{
		"<leader>zf",
		function()
			Snacks.toggle.zoom():toggle()
		end,
		desc = "Zoom Mode",
	},

	{ "<leader>f", group = "Find" },
	{
		"<leader>fg",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git Files",
	},
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	{
		"<leader>fr",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep String",
	},
	{
		"<leader>fb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Find Buffers",
	},
	{
		"<leader>ft",
		"<cmd>Trouble todo<cr>",
		desc = "Find TODO",
	},
	{
		"<leader>fs",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "Find LSP Symbols",
	},
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps",
	},
	{
		"<leader>fv",
		function()
			Snacks.picker.cliphist()
		end,
		desc = "Find in clipboard",
	},
	{
		"<leader>fe",
		function()
			Snacks.picker.icons()
		end,
		desc = "Find icons",
	},
	{
		"<leader>fn",
		function()
			Snacks.picker.notifications()
		end,
		desc = "Notification History",
	},
	{
		"<leader>sr",
		function()
			local grug = require("grug-far")
			local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
			grug.open({
				transient = true,
				prefills = {
					filesFilter = ext and ext ~= "" and "*." .. ext or nil,
				},
			})
		end,
		mode = { "n", "x" },
		desc = "Search and Replace",
	},
}

for n = 1, 9 do
	local key = string.format("<leader>%d", n)
	local term = string.format("%d:lua Snacks.terminal.toggle()<CR>", n)
	table.insert(mappings, { key, term, hidden = true })
end

wk.add(mappings)
wk.setup({})
