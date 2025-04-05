-- Require the font configuration
local font_config = require('config.font')

-- Require the keymap configuration
local keymap = require('config.keymap')

-- Require the appearance configuration
local appearance = require('config.appearance')

-- generic settings
local M = {}

M = {
	default_prog = { '/usr/bin/fish' },
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	window_close_confirmation = 'NeverPrompt',
	warn_about_missing_glyphs = false,
}

-- Return the two configurations as a table
return {
	M,
	font_config,
	keymap,
	appearance,
}
