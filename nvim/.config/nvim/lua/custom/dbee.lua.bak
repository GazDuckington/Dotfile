return {
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"kndndrj/projector-dbee"
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install("go")
		end,
		config = function()
			require("dbee").setup(
				{
					outputs = {
						require("projector_dbee").OutputBuilder:new(),
					},
				}
			)
		end,
	}
}
