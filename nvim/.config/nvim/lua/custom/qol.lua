return {
	{
		'levouh/tint.nvim',
		opts = {
			tint = -50,
			window_ignore_function = function(winid)
				local bufid = vim.api.nvim_win_get_buf(winid)
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufid })
				local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

				-- Do not tint `terminal` or floating windows, tint everything else
				return buftype == "terminal" or floating
			end
		}
	},
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
		"p00f/nvim-ts-rainbow",
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
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*",
			conf = { rgb_fn = true, }
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
		opts = {
			toggler = {
				line = '<C-c>',
			},
			opleader = {
				line = '<C-c>',
			},
		}
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	}
}
