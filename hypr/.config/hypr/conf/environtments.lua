local M = {}
M.environment = {
	GSK_RENDERER = "ngl",
	XCURSOR_SIZE = 24,
	BROWSER = "zen-browser",
}

M.setup = function()
	for key, val in pairs(M.environment) do
		hl.env(key, val) -- Assuming 'hl' is your library's handle
	end
end

return M
