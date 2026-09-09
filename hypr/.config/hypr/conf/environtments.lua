local M = {}
M.environment = {
	GSK_RENDERER = "ngl",
	XCURSOR_SIZE = 24,
	XCURSOR_THEME = "capitaine-cursors-light",
	HYPRCURSOR_THEME = "capitaine-cursors-light",
	HYPRCURSOR_SIZE = "24",
	BROWSER = "zen-browser",
	QT_QPA_PLATFORMTHEME = "qt6ct",
	QT_STYLE_OVERRIDE = "kvantum",
}

M.setup = function()
	for key, val in pairs(M.environment) do
		hl.env(key, val) -- Assuming 'hl' is your library's handle
	end
end

return M
