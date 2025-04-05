local wezterm = require("wezterm")

return {
	default_prog = { '/usr/bin/fish', '-l' },
	font = wezterm.font {
		family = 'BlexMono Nerd Font',
		harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
	},
	font_size = 12.0,
	cursor_thickness = 5,
	window_background_opacity = 0.7,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
	colors = {
		background = '#181825',
		cursor_bg = '#EC2864',
		cursor_fg = '#010409'
	},
	window_close_confirmation = 'NeverPrompt',
}
