-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
-- https://gtihub.com/GazDuckington/Dotfile/nvim
--
local pack_base = vim.fn.stdpath("data") .. "/site/pack"
local pack_dir = pack_base .. "/core/opt"

function vim.pack.add(...)
	vim.fn.mkdir(pack_dir, "p")
	local urls = {}
	for i = 1, select("#", ...) do
		local arg = select(i, ...)
		if type(arg) == "table" then
			for _, url in ipairs(arg) do
				table.insert(urls, url)
			end
		elseif type(arg) == "string" then
			table.insert(urls, arg)
		end
	end
	for _, url in ipairs(urls) do
		local src_url = type(url) == "string" and url or type(url) == "table" and url.src
		if src_url then
			local name = src_url:match("/([^/]+)$")
			if name and vim.fn.isdirectory(pack_dir .. "/" .. name) == 0 then
				vim.fn.system({ "git", "clone", "--depth", "1", src_url, pack_dir .. "/" .. name })
			end
		end
	end
end

function vim.pack.use(name, setup_fn)
	vim.cmd("packadd " .. name)
	if setup_fn then
		setup_fn()
	end
end

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add(
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/romgrk/barbar.nvim" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/catgoose/nvim-colorizer.lua" },
	{ src = "https://github.com/Bekaboo/dropbar.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/sudo-tee/opencode.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/nat-418/boole.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" },
	{ src = "https://github.com/chrisgrieser/nvim-spider" },
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{ src = "https://github.com/altermo/ultimate-autopair.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/adriankarlen/plugin-view.nvim" }
)

vim.pack.use("nvim-web-devicons", function()
	require("nvim-web-devicons").setup()
end)
vim.pack.use("plenary.nvim")
vim.pack.use("opencode.nvim")
vim.pack.use("plugin-view.nvim", function()
	require("plugin-view").setup()
end)

require("settings").setup()
require("keybinds").setup()
