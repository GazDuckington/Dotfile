local mappings = {
	{ "<leader>.", ":cd ~/.config/nvim<cr>:e init.lua<cr>", desc = "Open Neovim Config" },
	{ "<leader>n", ":nohl<cr>",                             desc = "Reset highlight" },
	{ "<leader>i", "<cmd>cd %:p:h<cr>",                     desc = "Cd to Buffer" },
	{ "<leader>o", ":e ",                                   desc = "Open/Create File" },
	{ "<leader>c", ":ColorizerToggle<cr>",                  desc = "Toggle colorizer" },
	-- { "<leader>C",  ":Telescope conventional_commits<cr>",                    desc = "conventional commit" },

	-- file manager
	{
		"<leader>e",
		-- function()
		-- Snacks.picker.explorer()
		-- end,
		-- "<cmd>Oil<cr>",
		"<cmd>NvimTreeToggle<cr>",
		desc = "Open file manager"
	},
	-- { "<leader>ec", "<cmd>Yazi cwd<cr>",                                      desc = "Open yazi file manager in current directory" },

	{ "<leader>m",  group = "Menu" },
	{ "<leader>mg", function() Snacks.lazygit() end,            desc = "LazyGit" },
	{ "<leader>ml", "<cmd>Lazy<cr>",                            desc = "Open Lazy.nvim menu" },
	{ "<leader>mm", "<cmd>Mason<cr>",                           desc = "Open Mason menu" },
	{ "<leader>ms", ":saveas ",                                 desc = "Save buffer as" },
	{ "<leader>mi", ":LspInfo<cr>",                             desc = "LSP Info" },
	-- { "<leader>mn", ":Navbuddy<cr>",                         desc = "Navbuddy, explore breadcrumb" },
	-- { "<leader>mf", ":FocusToggle<cr>",                      desc = "FocusToggle" },

	{ "<leader>h",  group = "Helps" },
	{ "<leader>hk", function() Snacks.picker.keymaps() end,     desc = "L:vnoremap < <gvist all keymaps" },
	{ "<leader>hh", function() Snacks.picker.help() end,        desc = "Help Tags" },

	{ "<leader>v",  group = "Views" },
	{ "<leader>vl", "<cmd>vsplit<cr><C-w>l",                    desc = "Focus split right" },
	{ "<leader>vj", "<cmd>split<cr><C-w>j",                     desc = "Focus split down" },

	{ "<leader>q",  group = "Quickfix" },
	{ "<leader>qN", ":cprevious<cr>",                           desc = "Previous" },
	{ "<leader>qo", ":copen<cr>",                               desc = "Open" },
	{ "<leader>qn", ":cnext<cr>",                               desc = "Next" },

	{ "<leader>x",  group = "Trouble" },
	{ "<leader>xx", function() Snacks.picker.diagnostics() end, desc = "Worksapce Diagnostics" },
	{ "<leader>xq", function() Snacks.picker.qflist() end,      desc = "QuickFix" },


	{ "<leader>t",  group = "Git Signs" },
	{
		"<leader>ts", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" },
	},
	{
		"<leader>tr", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" },
	},
	{
		"<leader>tS", ":Gitsigns stage_buffer<CR>", mode = "n",
	},
	{
		"<leader>tu", ":Gitsigns undo_stage_hunk<CR>", mode = "n",
	},
	{
		"<leader>tR", ":Gitsigns reset_buffer<CR>", mode = "n",
	},
	{
		"<leader>tp", ":Gitsigns preview_hunk<CR>", mode = "n",
	},
	{
		"<leader>tb", ":Gitsigns blame_line full=true<CR>", mode = "n",
	},
	{
		"<leader>tB", ":Gitsigns toggle_current_line_blame<CR>", mode = "n",
	},
	{
		"<leader>td", ":Gitsigns diffthis<CR>", mode = "n",
	},
	{
		"<leader>tD", ":Gitsigns diffthis ~<CR>", mode = "n",
	},
	{
		"<leader>tt", ":Gitsigns toggle_deleted<CR>", mode = "n",
	},
	{
		"<leader>ti", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" },
	},
	{ "<leader>b",  group = "Buffer Sorting" },
	-- sort automatically by...
	{ "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>",         desc = "Order By Number" },
	{ "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>",            desc = "Order By Directory" },
	{ "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>",             desc = "Order By Language" },
	{ "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>",         desc = "Order By Window Number" },

	{ "<leader>z",  group = "Snacks Mode" },
	{ "<leader>zz", function() Snacks.toggle.zen():toggle() end,  desc = "Zen Mode" },
	{ "<leader>zd", function() Snacks.toggle.dim():toggle() end,  desc = "Dim Mode" },
	{ "<leader>zf", function() Snacks.toggle.zoom():toggle() end, desc = "Zoom Mode" },


	-- telescope stuff
	{ "<leader>f",  group = "Find" },
	{ "<leader>fg", function() Snacks.picker.git_files() end,     desc = "Find Git Files" },
	{ "<leader>ff", function() Snacks.picker.files() end,         desc = "Find Files" },
	{ "<leader>fr", function() Snacks.picker.grep() end,          desc = "Grep String" },
	{ "<leader>fb", function() Snacks.picker.buffers() end,       desc = "Find Buffers" },
	{ "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Find TODO" },
	{ "<leader>fs", function() Snacks.picker.lsp_symbols() end,   desc = "Find LSP Symbols" },
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	},
	{ "<leader>fv", function() Snacks.picker.cliphist() end,      desc = "Find in clipboard" },
	{ "<leader>fe", function() Snacks.picker.icons() end,         desc = "Find icons" },
	{ "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notification History" },
}

for n = 1, 9 do
	local key = string.format("<leader>%d", n)
	local term = string.format("%d:lua Snacks.terminal.toggle()<CR>", n)
	table.insert(mappings, { key, term, hidden = true })
end

return {
	{
		"folke/which-key.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.add(mappings)
			wk.setup({})
		end
	}
}
