return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		init = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("snacks_explorer_start_directory", { clear = true }),
				desc = "Start Snacks Explorer with directory",
				once = true,
				callback = function()
					local dir = vim.fn.argv(0) --[[@as string]]
					if dir ~= "" and vim.fn.isdirectory(dir) == 1 then
						Snacks.picker.explorer({ cwd = dir })
					end
				end,
			})
		end,
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
			rename = { enabled = true },
			bufdelete = { enabled = true },
			picker = {
				sources = {
					explorer = {
						finder = "explorer",
						layout = {
							layout = {
								-- position = "right",
								-- border = "rounded",
								backdrop = 75,
								width = 0.8,
								height = 0.8,
							},
							preset = "default",
							preview = true,
						},
						replace_netrw = true,
						auto_close = true,
						follow_file = true,
						jump = { close = true },
					},
				},
				explorer = {
					win = {
						list = {
							keys = {
								["<BS>"] = "explorer_up",
								["l"] = "confirm",
								["h"] = "explorer_close", -- close directory
								["a"] = "explorer_add",
								["d"] = "explorer_del",
								["r"] = "explorer_rename",
								["c"] = "explorer_copy",
								["m"] = "explorer_move",
								["o"] = "explorer_open", -- open with system application
								["P"] = "toggle_preview",
								["y"] = "explorer_yank",
								["u"] = "explorer_update",
								["<c-c>"] = "tcd",
								["."] = "explorer_focus",
								["I"] = "toggle_ignored",
								["H"] = "toggle_hidden",
								["Z"] = "explorer_close_all",
								["]g"] = "explorer_git_next",
								["[g"] = "explorer_git_prev",
							},
						},
					},
				},
			},
			explorer = {
				enabled = true,
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
