local name = function(str)
	local pattern = "^[^-]+-(.+)$"
	return string.match(str, pattern)
end


if vim.g.colors_name == nil then
	vim.g.colors_name = "cattpuccin-mocha"
end

local scheme = name(vim.g.colors_name)
if scheme == nil then
	scheme = "mocha"
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local color = require("catppuccin.palettes").get_palette(scheme)
			require("catppuccin").setup({
				flavour = scheme,
				transparent_background = true,
				term_colors = true,
				default_integrations = false,
				integrations = {
					snacks = true,
					mason = true,
					leap = true,
					treesitter = true,
					ts_rainbow = true,
					nvimtree = true,
					telescope = true,
					barbar = true,
					which_key = true,
					gitsigns = true,
					mini = true,
					blink_cmp = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
							ok = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
				},
				custom_highlights = {
					CursorLine = { bg = color.crust },
					LineNr = { fg = color.surface2 },
					CursorLineNr = {
						fg = color.green,
						bg = color.mantle,
						bold = true,
					},
					IndentBlanklineContextChar = {
						fg = color.mauve,
						nocombine = true,
					},
					IndentBlanklineSpaceChar = {
						fg = color.surface0,
					},
					NormalFloat = { bg = color.crust },
					Pmenu = { bg = color.crust },
					PmenuSel = { fg = color.text, bg = color.crust, style = { 'bold' } },
					CmpBorder = {
						fg = color.blue,
					},
					Comment = {
						fg = color.lavender,
					},
					MiniIndentscopeSymbol = {
						fg = color.surface2,
					}
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end
	}
}
