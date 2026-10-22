vim.pack.use("render-markdown.nvim", function()
	require("render-markdown").setup({
		anti_conceal = { enabled = false },
		file_types = { "markdown" },
		ft = { "markdown", "Avante", "copilot-chat" },
	})
end)

local opencode_cmd = "opencode"

---@type snacks.terminal.Opts
local opencode_terminal_opts = {
	win = {
		position = "right",
		enter = false,
	},
}

-- Fallback credentials, used only when connecting to a manually configured
-- `server.url`. Discovery picks the password up from OpenCode's own
-- `service.json` registration, which always takes precedence.
local function read_password()
	local keyfile = vim.fn.expand("~/.config/opencode/server-password")
	if vim.fn.filereadable(keyfile) == 1 then
		local lines = vim.fn.readfile(keyfile)
		if #lines > 0 then
			return vim.fn.trim(lines[1])
		end
	end
end

---@type opencode.Opts
vim.g.opencode_opts = {
	server = {
		password = read_password(),
		start = function()
			require("snacks.terminal").open(opencode_cmd, opencode_terminal_opts)
		end,
	},
}

local map = vim.keymap.set

map({ "n", "x" }, "<leader>aa", function()
	require("opencode").ask()
end, { desc = "Ask OpenCode" })

map({ "n", "x" }, "<leader>as", function()
	require("opencode").select()
end, { desc = "Select OpenCode action" })

map({ "n", "x" }, "<leader>ai", function()
	require("opencode").ask("@this: ")
end, { desc = "Ask OpenCode about this" })

map({ "n", "x" }, "<leader>ad", function()
	return require("opencode").operator("@this")
end, { expr = true, desc = "Send to OpenCode" })

map("n", "<leader>al", function()
	return require("opencode").operator("@this") .. "_"
end, { expr = true, desc = "Send line to OpenCode" })

map("n", "<leader>at", function()
	require("snacks.terminal").toggle(opencode_cmd, opencode_terminal_opts)
end, { desc = "Toggle OpenCode terminal" })
