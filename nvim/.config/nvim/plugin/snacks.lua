vim.pack.add({ "https://github.com/folke/snacks.nvim" })
require("snacks").setup({
	bigfile = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
			{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
			{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
			{
				icon = " ",
				title = "System",
				desc = "Packages Loaded",
				padding = 1,
				indent = 2,
				-- Use the 'text' key with a generated string instead of a raw function
				text = {
					{
						"󰚥 " .. #vim.api.nvim_list_runtime_paths() .. " packages in runtime",
						hl = "SnacksDashboardSpecial",
					},
				},
			},
		},
	},
	dim = { enabled = true },
	zen = { enabled = true },
	win = { enabled = true },
	indent = { enabled = true },
	scroll = { enabled = true },
	rename = { enabled = false },
	bufdelete = { enabled = true },
	explorer = { enabled = true },
	terminal = {
		enabled = true,
		win = {
			position = "float",
			title = "terminal",
			border = "rounded",
			backdrop = 75,
			keys = {
				term_normal = {
					"<esc>",
					function()
						return "<C-\\><C-n>"
					end,
					mode = "t",
					expr = true,
					desc = "Double escape to normal mode",
				},
				q = "hide",
				["<esc>"] = "hide",
			},
		},
	},
	toggle = {
		map = vim.keymap.set,
		enabled = true,
		which_key = true,
		notify = true,
	},
})
