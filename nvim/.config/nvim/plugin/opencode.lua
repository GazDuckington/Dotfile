vim.pack.use("render-markdown.nvim", function()
	require("render-markdown").setup({
		anti_conceal = { enabled = false },
		file_types = { "markdown", "opencode_output" },
		ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
	})
end)
require("opencode").setup({
	prefered_picker = "snacks",
	prefered_completion = "blink",
	opencode_executable = vim.fn.expand("~/.local/bin/opencode-1.18.31"),
	server = {
		password = function()
			local keyfile = vim.fn.expand("~/.config/opencode/server-password")
			if vim.fn.filereadable(keyfile) == 1 then
				return vim.fn.trim(vim.fn.readfile(keyfile)[1])
			end
		end,
	},
})
