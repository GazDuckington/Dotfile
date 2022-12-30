local wezterm = require("wezterm")

return {
	xcursor_theme = 'Vimix-white',
	default_prog = { '/usr/bin/fish', '-l' },
	font = wezterm.font 'FiraCode Nerd Font',
	font_size = 10.0,
	cursor_blink_rate = 500,
	window_background_opacity = 0.9,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
	colors = {
		background = '#11111B',
		cursor_bg = '#EC2864',
		cursor_fg = '#010409'
	},
	window_close_confirmation = 'NeverPrompt',
}
