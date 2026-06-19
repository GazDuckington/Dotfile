vim.pack.add(
	{ "https://github.com/sudo-tee/opencode.nvim" },
	{ "https://github.com/MeanderingProgrammer/render-markdown.nvim" }
)
vim.cmd("packadd render-markdown.nvim")
vim.cmd("packadd opencode.nvim")
require("render-markdown").setup({
	anti_conceal = { enabled = false },
	file_types = { "markdown", "opencode_output" },
	ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
})
require("opencode").setup()
