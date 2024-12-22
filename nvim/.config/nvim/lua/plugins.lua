--[[
-- Setup initial configuration,
--
-- Primarily just download and execute lazy.nvim
--]]
local M = {}

M.setup = function()
	local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system {
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		}
	end

	-- Add lazy to the `runtimepath`, this allows us to `require` it.
	---@diagnostic disable-next-line: undefined-field
	vim.opt.rtp:prepend(lazypath)

	-- Set up lazy, and load my `lua/custom/` folder
	require("lazy").setup({ import = "custom" }, {
		change_detection = {
			notify = true,
		},
		ui = { border = "rounded" },
	})
end
return M
