vim.pack.add({ "https://github.com/linux-cultist/venv-selector.nvim" })
vim.cmd("packadd venv-selector.nvim")
require("venv-selector").setup()
