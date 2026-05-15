local M = {}

-- We store the data in a structured format so it's easy to read
M.rules = {
	-- SIZE & FLOAT
	{
		match = { class = "^(pulsemixer|termmenu|/home/gaz/.local/bin/hyprswitch.sh|wiremix)$" },
		size = "40% 25%",
		float = true,
	},
	{
		match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com\\.gabm\\.satty)$" },
		size = "40% 35%",
		float = true,
	},

	-- SIMPLE FLOATS
	{
		match = { class = "^(nwg-look|[Kk]vantummanager|update|bauh|nm-connection-editor|rpmc|Rofi)$" },
		float = true,
	},
	{
		match = { title = "^(Picture in picture)$" },
		float = true,
	},
	{
		match = { class = "^(brave)$", title = "^(Save File|Open File)$" },
		float = true,
	},
	{
		match = { class = "^(LibreWolf|[Zz]en.*|[Ff]ire[Ff]ox)$", title = "^(Picture-in-Picture)$" },
		float = true,
	},
	{
		match = { class = "^(blueman-manager|xdg-desktop-portal-.*|org.kde.polkit-.*|CachyOSHello|zenity)$" },
		float = true,
	},
	{
		match = { title = "^(Steam - Self Updater)$" },
		float = true,
	},

	-- WORKSPACES
	{
		match = { class = "^(firefox|zen|helium|.*-[Bb]rowser.*)$" },
		workspace = "1",
	},
	{
		match = { class = "^(com.[Ss]tremio.[Ss]tremio|[Ss]remio)$" },
		workspace = "2",
	},
	{
		match = { class = "^([Bb]eekeeper-studio)$" },
		workspace = "3",
	},
	{
		match = { class = "^([Ss]team)$" },
		workspace = "4",
	},
	{
		match = { class = "^(ru-turikhay-tlauncher-bootstrap-Bootstrap|[Mm]inecraft.*)$" },
		workspace = "5",
		tile = true,
	},
	{
		match = { class = "^([Vv]esktop)$" },
		workspace = "5",
	},
	{
		match = { class = "^([Ss]team_app_.*|gamescope)$" },
		workspace = "10",
		fullscreen = 1,
	},

	-- OPACITY
	{
		match = { class = "^(Thunar|Nautilus)$" },
		opacity = 0.92,
	},
	{
		match = { class = "^(discord|armcord|webcord|vesktop)$" },
		opacity = 0.96,
	},
	{
		match = { title = "^(Telegram|QQ|NetEase Cloud Music Gtk4)$" },
		opacity = 0.95,
	},

	-- MULTI-PROPERTY RULES
	{
		match = { class = "^(imv|mpv|termfloat|nemo|ncmpcpp)$" },
		float = true,
		size = "960 540",
		move = "25% 0",
	},
	{
		match = { class = "^(danmufloat)$" },
		float = true,
		move = "25% 0",
		pin = true,
		rounding = 5,
		size = "960 540",
	},

	-- SPECIALS
	{ match = { class = "^(kitty|alacritty)$" }, animation = "slide right" },
	{ match = { class = "^(firefox|waybar)$" }, no_blur = true },
}

M.setup = function(custom_rules)
	-- 1. Load the default rules defined in this file
	for _, rule in ipairs(M.rules) do
		hl.window_rule(rule)
	end

	-- 2. Load custom rules passed via the setup argument
	if custom_rules and type(custom_rules) == "table" then
		for _, rule in ipairs(custom_rules) do
			hl.window_rule(rule)
		end
	end
end

return M
