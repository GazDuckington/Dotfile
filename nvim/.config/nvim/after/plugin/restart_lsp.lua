local function restart_lsps()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	-- Call :stop() directly on each client object
	for _, client in ipairs(clients) do
		client:stop()
	end

	vim.cmd.update()

	-- Defer reloading the buffer
	vim.defer_fn(function()
		vim.cmd.edit()
	end, 1000)
end

-- Create the :RestartLsp command
vim.api.nvim_create_user_command("RestartLsp", restart_lsps, {
	desc = "Restart active LSP clients for the current buffer",
})
