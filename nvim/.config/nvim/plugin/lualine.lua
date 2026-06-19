vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
vim.cmd("packadd lualine.nvim")

local line = {
	function()
		return " "
	end,
	padding = 0,
}
local md = {
	"mode",
	fmt = function(res)
		return res:sub(1, 3)
	end,
	color = { gui = "bold" },
}

require("lualine").setup({
	sections = {
		lualine_a = { md },
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				newfile_status = true,
				path = 3,
				symbols = {
					modified = "",
					readonly = "󰷧",
					unnamed = "[No Name]",
					newfile = "",
				},
			},
		},
		lualine_x = { "diff", "branch", "diagnostics", "filetype", "progress", "venv-selector" },
		lualine_y = {},
		lualine_z = { line },
	},
	options = {
		theme = "auto",
		globalstatus = false,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
})
