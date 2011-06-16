[ $(id -u) -eq 0 ] && return

function pacman() {
	case $1 in
		-S | -S[^sih]* | -R* | -U*) sudo pacman $* ;;
		* ) command pacman $* ;;
	esac
}

function clyde() {
	case $1 in
		-S | -S[^sih]* | -R* | -U*) sudo clyde $* ;;
		* ) command clyde $* ;;
	esac
}

function pip() {
	if [[ -n ${VIRTUAL_ENV+1} && -w $VIRTUAL_ENV ]] ; then
		command pip $*
	else
		case $1 in
			install | uninstall ) sudo pip $* ;;
			*) command pip $* ;;
		esac
	fi
}

function npm() {
	case $1 in
		install | uninstall ) sudo npm $* ;;
		*) command npm $* ;;
	esac
	}

function mount() {
	case $i in
		"" ) command mount ;;
		* ) sudo mount $* ;;
	esac
}


function gem(){
	case $1 in
		install | uninstall | update ) sudo gem $* ;;
		* ) command gem $* ;;
	esac
}

alias umount="sudo umount"

alias dhdpcd="sudo dhcpcd"
alias netcfg="sudo netcfg"

alias halt="sudo halt"
alias reboot="sudo reboot"

alias easy_install="sudo easy_install"

alias pppoe-connect="sudo pppoe-connect"
