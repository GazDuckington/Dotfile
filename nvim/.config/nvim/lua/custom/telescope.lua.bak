return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make"
			},
		},
		opts = {
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "→ ",
				results_title = "",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					}
				},
				borderchars = {
					-- { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
					{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
				mappings = {
					i = {
						["<esc>"] = 'close',
						["<A-j>"] = 'move_selection_next',
						["<A-k>"] = 'move_selection_previous',
					},
					n = {
						["<A-n>"] = 'move_selection_next',
						["<A-p>"] = 'move_selection_previous',
					}
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					-- theme = "dropdown",
					-- previewer = false,
				},
				live_grep = {
					only_sort_text = true,
					-- theme = "dropdown",
					-- previewer = false,
				},
				grep_string = {
					only_sort_text = true,
					-- theme = "dropdown",
					-- previewer = false,
				},
				buffers = {
					-- theme = "dropdown",
					-- previewer = false,
					-- initial_mode = "normal",
					mappings = {
						i = {
							["<A-d>"] = 'delete_buffer',
						},
						n = {
							["dd"] = 'delete_buffer',
						},
					},
				},
			},
			extensions = {
				"fzf", "lsp_handlers", "conventional_commits", "undo"
			}
		}
	}
}
