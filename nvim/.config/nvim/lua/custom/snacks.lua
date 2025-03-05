return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			dashboard = { enabled = true },
			dim = { enabled = true },
			zen = { enabled = true },
			win = { enabled = true },
			indent = { enabled = true },
			scroll = { enabled = true },
			rename = { enabled = false },
			bufdelete = { enabled = true },
			explorer = { enabled = true },
			picker = {
				sources = {
					explorer = {
						auto_close = true,
						layout = { layout = { position = "right" }, preview = false },
					},
				},
			},
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
			}
		}
	}
}
