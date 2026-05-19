local M = {}

local terminal = "kitty"
local menu = "walker"
local menu_socket = "nc -U /run/user/1000/walker/walker.sock"
local main_mod = "SUPER"

local d = hl.dsp

-- Structure: { Modifiers, Key, Dispatcher Object }
M.binds = {
	-- General Actions
	{ main_mod,             "F4",     d.exec_cmd("wlogout") },
	{ main_mod,             "Z",      d.exec_cmd("~/.local/bin/kitty-launch.sh wiremix") },
	{ main_mod,             "Return", d.exec_cmd(terminal) },
	{ main_mod,             "Q",      d.window.close() },
	{ main_mod,             "E",      d.exec_cmd(menu .. " -m files") },
	{ main_mod,             "F",      d.window.float({ action = "toggle" }) },
	{ main_mod,             "D",      d.exec_cmd(menu_socket) },
	{ main_mod,             "C",      d.exec_cmd("bash -c '~/.local/bin/color_picker.sh'") },
	{ main_mod,             "N",      d.exec_cmd("bash -c 'qs ipc call notificationMenu toggle'") },

	-- Layout & Master
	{ main_mod .. " SHIFT", "SPACE",  d.layout("swapwithmaster master") },
	{ main_mod .. " SHIFT", "F",      d.window.fullscreen() },
	{ main_mod,             "SPACE",  d.layout("focusmaster") },
	{ "ALT",                "SPACE",  d.exec_cmd("sh ~/.config/hypr/scripts/focusfloat.sh") },

	-- Focus movement
	{ main_mod,             "h",      d.focus({ direction = "left" }) },
	{ main_mod,             "l",      d.focus({ direction = "right" }) },
	{ main_mod,             "k",      d.focus({ direction = "up" }) },
	{ main_mod,             "j",      d.focus({ direction = "down" }) },

	-- Move windows
	{ main_mod .. " SHIFT", "H",      d.window.move({ direction = "left" }) },
	{ main_mod .. " SHIFT", "L",      d.window.move({ direction = "right" }) },
	{ main_mod .. " SHIFT", "K",      d.window.move({ direction = "up" }) },
	{ main_mod .. " SHIFT", "J",      d.window.move({ direction = "down" }) },

	-- Workspace Navigation
	{ main_mod,             "TAB",    d.focus({ workspace = "e+1" }) },
	{ main_mod .. " SHIFT", "TAB",    d.focus({ workspace = "e-1" }) },

	-- Special Workspaces
	{ main_mod,             "S",      d.workspace.toggle_special("magic") },
	{ main_mod .. " SHIFT", "S",      d.window.move({ workspace = "special:magic" }) },

	-- Utilities
	{ main_mod,             "V",      d.exec_cmd(menu .. " -m clipboard") },
	{ "",                   "PRINT",  d.exec_cmd("bash -c '~/.config/walker/scripts/scrot.sh'") },
}

-- Repeating Binds (Workspaces 1-10)
for i = 1, 10 do
	local key = tostring(i % 10)
	table.insert(M.binds, { main_mod, key, d.focus({ workspace = tostring(i) }) })
	table.insert(M.binds, { main_mod .. " CTRL", key, d.window.move({ workspace = tostring(i) }) })
	table.insert(M.binds, { main_mod .. " SHIFT", key, d.window.move({ workspace = tostring(i), silent = true }) })
end

-- Resize & Move (Repeatable 'e' flag)
M.binde = {
	{ main_mod .. " CTRL", "h", d.window.resize({ x = -10, y = 0 }) },
	{ main_mod .. " CTRL", "j", d.window.resize({ x = 0, y = 10 }) },
	{ main_mod .. " CTRL", "k", d.window.resize({ x = 0, y = -10 }) },
	{ main_mod .. " CTRL", "l", d.window.resize({ x = 10, y = 0 }) },
}

-- Media Keys (Locked 'l' flag)
M.bindl = {
	{ "", "XF86AudioMute", d.exec_cmd("~/.local/bin/changevol.sh mute") },
	{ "", "XF86AudioPlay", d.exec_cmd("playerctl play-pause") },
}

M.setup = function()
	-- This helper ensures the final string is "MOD + MOD + KEY"
	local function get_key(mod, key)
		-- 1. Trim whitespace
		local m = mod:gsub("^%s*(.-)%s*$", "%1")
		local k = key:gsub("^%s*(.-)%s*$", "%1")

		-- 2. If there are no modifiers (like for PRINT), just return the key
		if m == "" then
			return k
		end

		-- 3. Ensure the joiner is " + "
		-- This handles cases where you might have written "SUPER SHIFT" or "SUPER, SHIFT"
		m = m:gsub("[%s,]+", " + ")

		return m .. " + " .. k
	end

	-- standard binds
	for _, b in ipairs(M.binds) do
		hl.bind(get_key(b[1], b[2]), b[3])
	end

	-- repeatable binds
	for _, b in ipairs(M.binde) do
		hl.bind(get_key(b[1], b[2]), b[3], "e")
	end

	-- locked binds
	for _, b in ipairs(M.bindl) do
		hl.bind(get_key(b[1], b[2]), b[3], "l")
	end
end
return M
