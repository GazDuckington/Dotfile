hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = "1",
})
require("conf.environtments").setup()
require("conf.keybinding").setup()
require("conf.autostart").setup()
require("conf.config").setup()
require("conf.rules").setup()
require("conf.animations").setup()
