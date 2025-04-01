return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',
		version = '1.*',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			enabled = function()
				return not vim.tbl_contains({ "snacks_picker_input" }, vim.bo.filetype)
			end,
			completion = {
				list = {
					selection = { preselect = true } --"manual" -- | "preselect" -- | "auto-insert"
				},
				trigger = {
					show_on_keyword = true,
					show_on_trigger_character = true
				},
			},
			keymap = {
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

			appearance = {
				-- use_nvim_cmp_as_default = false,
				nerd_font_variant = 'mono'
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},
		opts_extend = { "sources.default" }
	}
}
