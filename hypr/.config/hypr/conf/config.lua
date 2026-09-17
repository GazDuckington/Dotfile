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
			resize_on_border = false,
			allow_tearing = false,
			layout = "scrolling",
		},

		decoration = {
			rounding = 15,

			active_opacity = 1.0,
			inactive_opacity = 1.0,

			shadow = {
				enabled = false,
				range = 4,
				render_power = 3,
			},

			blur = {
				enabled = true,
				size = 1,
				passes = 2,
				vibrancy = 0.1696,
			},
		},

		-- layout
		master = {
			new_status = "slave",
		},

		scrolling = {
			direction = "right",
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

		xwayland = {
			enabled = true,
		},
	})
end
return M
