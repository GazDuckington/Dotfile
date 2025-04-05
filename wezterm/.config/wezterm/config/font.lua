local wezterm = require("wezterm")

return {
	font_size = 12.0,
	font = wezterm.font_with_fallback({
		{
			family = 'BlexMono Nerd Font',
			harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
		},
		{
			family = 'JetBrains Mono',
			harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
		},
		'Noto Color Emoji',
	})
}
