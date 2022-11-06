#!/usr/bin/env bash

if [ "$TERM" = "linux" ]; then
	printf %b '\e]P01E1E2E' # set background color to "Base"
	printf %b '\e]P8585B70' # set bright black to "Surface2"

	printf %b '\e]P7BAC2DE' # set text color to "Text"
	printf %b '\e]PFA6ADC8' # set bright white to "Subtext0"

	printf %b '\e]P1F38BA8' # set red to "Red"
	printf %b '\e]P9F38BA8' # set bright red to "Red"

	printf %b '\e]P2A6E3A1' # set green to "Green"
	printf %b '\e]PAA6E3A1' # set bright green to "Green"

	printf %b '\e]P3F9E2AF' # set yellow to "Yellow"
	printf %b '\e]PBF9E2AF' # set bright yellow to "Yellow"

	printf %b '\e]P489B4FA' # set blue to "Blue"
	printf %b '\e]PC89B4FA' # set bright blue to "Blue"

	printf %b '\e]P5F5C2E7' # set magenta to "Pink"
	printf %b '\e]PDF5C2E7' # set bright magenta to "Pink"

	printf %b '\e]P694E2D5' # set cyan to "Teal"
	printf %b '\e]PE94E2D5' # set bright cyan to "Teal"

	clear
fi

# env variables
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME="kvantum"

# pnpm
export PNPM_HOME="/home/gaz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$HOME"/cargo
export GNUPGHOME="$HOME"/gnupg
export GOPATH="$HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 

export GO111MODULE=on

# path
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/cargo/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/share/pyenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.surrealdb:$PATH"
export PATH="$HOME/.nix-profile/bin:$PATH"

if [[ "$(tty)" == "/dev/tty1" ]];then
	exec dk
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(starship init bash)"
