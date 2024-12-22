return {
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		-- event = "VeryLazy",
		opts = {
			use_diagnostic_signs = true,
			action_keys = {
				close = { "q", "<esc>" },
				cancel = "<c-e>"
			}
		}
	}
}
