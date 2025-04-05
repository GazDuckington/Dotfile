local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- configurations
local settings = require('config')

-- Function to extend the target table with values from the source table
local function extend_table(target, source)
	for key, value in pairs(source) do
		-- If the key already exists, and it's a table, we merge the tables recursively
		if type(value) == "table" and type(target[key]) == "table" then
			extend_table(target[key], value) -- Recursive call to merge nested tables
		else
			target[key] = value           -- Simply assign the value from source to target
		end
	end
end


for _, config_table in ipairs(settings) do
	extend_table(config, config_table)
end

return config
