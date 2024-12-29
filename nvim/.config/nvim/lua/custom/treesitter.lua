return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = "all",
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
