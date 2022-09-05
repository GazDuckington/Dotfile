# env variables
export QT_STYLE_OVERRIDE=kvantum
export sourcery_token='user_sDKPJj6fcS_yFfhF9CvcqdHwSKcULb__toO47ZVFUSGSctyNvT3X20VOFZM'

# path
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="~/bin:$PATH"

# pnpm
export PNPM_HOME="/home/gaz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv 
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

eval "$(starship init bash)"
