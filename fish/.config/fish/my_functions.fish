# functions

function gd
	cd (z -l | fzf --preview 'lsd --tree --color=always {2}' --preview-window right,60% | awk '{print $2}')
end

function vd
	set target (z -l | fzf --preview 'lsd --tree --color=always {2}' --preview-window right,60% | awk '{print $2}')
	if not test "$target" = ""
		nvim $target -c 'cd %:p:h'
		clear
	end
end

function vs
	set target (la ~/.vim/sessions/ | fzf --preview-window right,60% --preview 'bat --color=always ~/.vim/sessions/{1}' | awk '{print $1}')
	
	if not test "$target" = ""
		nvim +so ~/.vim/sessions/$target
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
  figlet -w 140 -f ANSI\ Shadow $argv | lolcat
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

