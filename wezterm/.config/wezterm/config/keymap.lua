local wezterm = require 'wezterm'
local M = {}

M = {
	{
		key = "E",
		mods = "CTRL",
		action = wezterm.action { QuickSelectArgs = {
			patterns = {
				"https?://\\S+"
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end)
		} }
	},
}

return { keys = M }
