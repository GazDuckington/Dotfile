return {
	"gutsavgupta/nvim-gemini-companion",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		require("gemini").setup()
	end,
	keys = {
		{ "<leader>gg", "<cmd>GeminiToggle<cr>",      desc = "Toggle Gemini sidebar" },
		{ "<leader>gc", "<cmd>GeminiSwitchToCli<cr>", desc = "Spawn or switch to AI session" },
		{ '<leader>gS', '<cmd>GeminiSend<cr>',        mode = { 'x' },                        desc = 'Send selection to Gemini' },
		{
			'<Esc>',
			function()
				local mode = vim.api.nvim_get_mode().mode
				if mode == 't' then
					return '<C-\\><C-n>'
				else
					return '<cmd>GeminiToggle<cr>'
				end
			end,
			expr = true,
			mode = { 'n', 'i', 'v', 't' },
			desc = 'Exit terminal or toggle Gemini',
		},
	}
}
