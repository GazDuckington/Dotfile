export EDITOR=nvim
export QT_STYLE_OVERRIDE=kvantum
export MY_GITHUB="github.com/GazDuckington"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
export SWAY_CURSOR_THEME=Qoqir-dark
export XCURSOR_THEME=Qoqir-dark
export XCURSOR_SIZE=24
export PATH=~/.npm-global/bin:$PATH
export BROWSER=zen-browser
export TERM=footclient
export QT_QPA_PLATFORMTHEME="qt5ct"

if uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi
