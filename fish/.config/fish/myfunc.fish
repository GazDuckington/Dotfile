# functions

function gd
	cd (z -l | fzf | awk '{print $2}')
end

function vd
	set target (z -l | fzf | awk '{print $2}')
	if not test "$target" = ""
		$EDITOR $target
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

