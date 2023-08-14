# functions

function gd
	cd (z -l | fzf --layout reverse --ansi --preview 'lsd --tree --color=always {2}' --preview-window right,60% | awk '{print $2}')
end

function vd
	set target (z -l | fzf --layout reverse --ansi --preview 'lsd --tree --color=always {2}' --preview-window right,60% | awk '{print $2}')
	if not test "$target" = ""
		nvim $target -c 'cd %:p:h'
		clear
	end
end

function vs
	set target (la ~/.local/share/nvim/sessions/ | fzf --layout reverse --ansi --preview-window right,60% --preview 'bat --color=always ~/.local/share/nvim/sessions/{1}' | awk '{print $1}')
	
	if not test "$target" = ""
		nvim +so ~/.local/share/nvim/sessions/$target
		clear
	end

end

function ofetch
  if not set -q argv[1]
    onefetch -c 4
  else
    onefetch $argv -c 4
  end
end

function lolban
  figlet -w 140 -f ANSI\ Shadow $argv | lolcat
end

function ban
  figlet -w 140 -f ANSI\ Shadow $argv
end

function lol
	echo "$argv" | lolcat
end

function take
	mkdir -p $argv && cd $argv
end

function ginit
	set MY_GITHUB "https://github.com/GazDuckington"
	go mod init $MY_GITHUB/$argv
end

function fedora_up
	sudo dnf system-upgrade download --releasever=$argv
end

