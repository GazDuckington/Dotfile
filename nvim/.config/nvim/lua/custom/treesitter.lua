local Constant = require("core.constant.lsp")
local must_install = Constant.must_install

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = must_install,
			context_commentstring = {
				enable = true
			},
			highlight = {
				enable = true
			},
			indent = {
				enable = true
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		}
	}
}
