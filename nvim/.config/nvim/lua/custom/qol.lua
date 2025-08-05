return {
	-- {
	-- 'sheimer/tint.nvim',
	-- opts = {
	-- tint = -50,
	-- window_ignore_function = function(winid)
	--     local bufid = vim.api.nvim_win_get_buf(winid)
	--     local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufid })
	--     local floating = vim.api.nvim_win_get_config(winid).relative ~= ""
	--     -- Do not tint `terminal` or floating windows, tint everything else
	--     return buftype == "terminal" or floating
	-- end
	-- 	}
	-- },
	-- { "GazDuckington/sunglasses.nvim", config = true },
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { 'treesitter', 'indent' }
			end
		}
	},
	{
		"chrisgrieser/nvim-spider",
		opts = {
			skipInsignificantPunctuation = false,
			subwordMovement = true,
			customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
		}
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				-- Defaults
				enable_close = true,      -- Auto close tags
				enable_rename = true,     -- Auto rename pairs of tags
				enable_close_on_slash = false -- Auto close on trailing </
			},
		}
	},
	{
		'altermo/ultimate-autopair.nvim',
		event = { 'InsertEnter', 'CmdlineEnter' },
		branch = 'v0.6', --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		opts = {
			filetypes = {
				"*",
			},
			user_default_options = {
				rgb_fn = true,
				tailwind = 'both', -- Enable tailwind colors
				tailwind_opts = { -- Options for highlighting tailwind names
					update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
				},
			}
		}
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		"nat-418/boole.nvim",
		event = "BufRead",
		config = function()
			require("boole").setup({
				mappings = {
					increment = "t",
					decrement = "T"
				}
			})
		end
	},
	{
		"numToStr/Comment.nvim",
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		opts = {
			pre_hook = function()
				require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
			end,
			toggler = {
				line = '<C-c>',
			},
			opleader = {
				line = '<C-c>',
			},
		}
	},
	-- {
	-- 	'echasnovski/mini.comment',
	-- 	version = '*',
	-- 	dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
	-- 	opts = {
	-- 		hooks = {
	-- 			pre = function()
	-- 				require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
	-- 			end
	-- 		}
	-- 	},
	-- 	mappings = {
	-- 		-- Toggle comment (like `gcip` - comment inner paragraph) for both
	-- 		-- Normal and Visual modes
	-- 		comment = 'C-c',
	--
	-- 		-- Toggle comment on current line
	-- 		comment_line = 'C-c',
	--
	-- 		-- Toggle comment on visual selection
	-- 		comment_visual = 'C-c',
	--
	-- 		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
	-- 		-- Works also in Visual mode if mapping differs from `comment_visual`
	-- 		textobject = 'C-c',
	-- 	},
	-- },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	}
}
