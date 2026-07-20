vim.pack.use("render-markdown.nvim", function()
	require("render-markdown").setup({
	anti_conceal = { enabled = false },
	file_types = { "markdown", "opencode_output" },
	ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
	})
end)
require("opencode").setup()
