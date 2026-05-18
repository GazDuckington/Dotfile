vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
		"https://github.com/rafamadriz/friendly-snippets",
})
local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
					enabled = function()
				return not vim.tbl_contains({ "snacks_picker_input" }, vim.bo.filetype)
			end,
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		-- 

							-- preset = 'enter',
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<Esc>'] = { 'hide', 'fallback' },
				['<CR>'] = { 'accept', 'fallback' },

				['<C-p>'] = { 'snippet_forward', 'fallback' },
				['<C-n>'] = { 'snippet_backward', 'fallback' },

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<Tab>'] = {
					function(cmp)
						if not cmp.snippet_active() then
							return cmp.show()
						end
					end,
					'select_next', 'fallback'
				},
				['<S-Tab>'] = { 'select_prev', 'fallback' },

				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = {
		documentation = { auto_show = false },
		list = {
			selection = { preselect = true, auto_insert = false },
		},
							trigger = {
					show_on_keyword = true,
					show_on_trigger_character = true
				},

		ghost_text = { enabled = true },
		menu = {
			draw = {
				columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
			},
		},
	},

	-- (Default) list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = { default = { "lsp", "path", "snippets", "buffer" } },

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"`
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "rust" },
})
