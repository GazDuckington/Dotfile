local color = require("conf.mocha")

local M = {}
M.setup = function()
	hl.config({
		ecosystem = {
			no_update_news = true,
		},

		general = {
			gaps_in = 5,
			gaps_out = 5,
			border_size = 2,
			col = {
				active_border = { colors = { color.sky, color.blue }, angle = 45 },
				inactive_border = color.mantle,
			},
			resize_on_border = false,
			allow_tearing = false,
			layout = "master",
		},

		decoration = {
			rounding = 10,

			active_opacity = 1.0,
			inactive_opacity = 1.0,

			shadow = {
				enabled = true,
				range = 4,
				render_power = 3,
				color = color.mantle,
			},

			blur = {
				enabled = true,
				size = 5,
				passes = 1,
				vibrancy = 0.1696,
			},
		},

		-- layout
		master = {
			new_status = "slave",
		},

		input = {
			kb_layout = "us",
			kb_variant = "",
			kb_model = "",
			kb_options = "",
			kb_rules = "",

			follow_mouse = 2,

			sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

			touchpad = {
				natural_scroll = false,
				disable_while_typing = true,
			},
		},

		misc = {
			force_default_wallpaper = 0,
			-- Set to 0 or 1 to disable the anime mascot wallpapers
			disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		},
	})
end
return M
