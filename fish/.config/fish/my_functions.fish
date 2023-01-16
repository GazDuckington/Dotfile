# functions

function gd
	cd (z -l | fzf --preview 'lsd --tree --color=always {2}' --preview-window down | awk '{print $2}')
end

function vd
	set target (z -l | fzf --preview 'lsd --tree --color=always {2}' --preview-window down | awk '{print $2}')
	if not test "$target" = ""
		nvim $target -c 'cd %:p:h'
		clear
	end
end

function vs
	set target (ls ~/vimsession/ | fzf --preview-window down --preview 'bat --color=always ~/vimsession/{1}' | awk '{print $1}')
	
	if not test "$target" = ""
		nvim +so ~/vimsession/$target
		clear
	end

end

function ofetch
  if not set -q argv[1]
    onefetch --show-logo never -c 4
  else
    onefetch $argv --show-logo never -c 4
  end
end

function lolban
  figlet -f ANSI\ Shadow $argv | lolcat
end

function lol
	$argv | lolcat
end

function take
	mkdir -p $argv && cd $argv
end

function ginit
	go mod init $MY_GITHUB/$argv
end

function fedora_up
	sudo dnf system-upgrade download --releasever=$argv
end

