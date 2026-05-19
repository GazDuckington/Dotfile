local M = {}
M.autostart = {
	-- Environment and System Services
	"systemctl --user import-environment &",
	"hyprctl setcursor 'capitaine-cursors-light' 24",
	"/usr/lib/polkit-kde-authentication-agent-1",

	-- Daemons and UI Components
	"awww-daemon",
	"orbit daemon",
	"qs",
	"hypridle",
	"wl-paste --watch cliphist store",
	"elephant",
	"walker --gapplication-service",

	"blueman-applet",
	"udiskie --smart-tray -f --terminal kitty",
	-- Scripts and Personal Autostarts
	"~/.local/bin/swaypaper.sh",

	-- Optional/Commented out (Uncomment to enable)
	-- "systemctl enable --now --user vicinae.service",
	-- "nm-applet",
	-- "foot --server",
}

M.setup = function()
	-- Register the event listener
	hl.on("hyprland.start", function()
		for _, cmd in ipairs(M.autostart) do
			-- Note: Use hl.dsp.exec_cmd or hl.exec_cmd based on your version
			hl.exec_cmd(cmd)
		end
	end)

	-- Register your keybinds here as well
	-- (Previous logic for hl.bind loops goes here)
	-- hl.exec_cmd("awww-daemon")
	-- hl.exec_cmd("orbit daemon")
end

return M
