[ $(id -u) -eq 0 ] && sudo="" || sudo="sudo"


# other
alias syncdate="s ntpd -qg"
alias uninstaller="wine /usr/lib/wine/fakedlls/uninstaller.exe"

function less() {
	[ `wc -l "$1" | awk '{print $1}'` -ge $LINES ] && less "$1" || cat "$1"
}

# mplayer 
function mp() {
	case $1 in
		music ) mplayer -shuffle $HOME/music/star/* ;;
	esac
}

function sync(){
#alias muywank="sudo mount -L uywankRoot /uywank; sudo mount -L uywankBoot /uywank/boot; sudo mount -L uywankUsr /uywank/usr; sudo mount -L uywankHome /uywank/home; sudo mount -L uywankBackup /uywank/backup"

#alias uuywank="sudo umount /uywank/home; sudo umount /uywank/usr; sudo umount /uywank/boot; sudo umount /uywank/backup; sudo umount /uywank"

#alias uywanksync="sudo rsync -avhAHXES --numeric-ids --delete  --exclude-from=$G_A/uywanksync_exclude --files-from=$G_A/uywanksync -r / /uywank"

#alias mywank="sudo mount -L ywankRoot /ywank; sudo mount -L ywankBoot /ywank/boot; sudo mount -L ywankUsr /ywank/usr; sudo mount -L ywankHome /ywank/home"

#alias uywank="sudo umount /ywank/home; sudo umount /ywank/usr; sudo umount /ywank/boot; sudo umount /ywank"
#alias ywanksync="sudo rsync -avhAHXES --numeric-ids --delete --delete-after  --exclude-from=$G_A/uywanksync_exclude --files-from=$G_A/uywanksync -r / /ywank"
}


# ¤go
function work(){
	case $1 in
		ssh )
			ssh deployer@218.108.75.212
			;;
	esac
}

# ¤ff ¤firefox
alias winecn='LANG=zh_CN.UTF-8 wine'
alias wineqq="wine ~/.wine/qq.exe"
alias ie="wine '/home/guten/.wine/drive_c/Program Files/Internet Explorer/IEXPLORE.exe'"
alias explorer="pacman"

alias thermal="acpi -t;sudo hddtemp /dev/sda"
alias cputhermal="acpi -t"
alias cpufreq="cpufreq-info"
alias off="sleep 2 && xset dpms force off"

function vm(){
	case $1 in
		xp ) qemu-kvm /vm/xp.img -m 256M -vga std -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
		xp2 ) qemu-kvm /vm/xp2.img -m 1G -vga std -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
		ubuntu ) qemu-kvm /vm/ubuntu.img -m 1G -vga vmware -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
	esac
}

vms=(xp xp3 ubuntu)
compdef "_describe vm vms" vm


# ¤backup #{{{1
function backup.ywank(){
	sudo rsync -azHXE --recursive -vh --del --delete-excluded --numeric-ids --exclude-from=/home/guten/.rsync/full_system/excludes --exclude='/uywank/*' / /uywank/ywank/
}

function restore.ywank(){
	sudo rsync -azHXE --recursive -vh --del --delete-excluded --numeric-ids /uywank/ywank /ywank
}

#}}}1

# ¤cmds #{{{1
function less() {
	[ `wc -l "$1" | awk '{print $1}'` -ge $LINES ] && less "$1" || cat "$1"
}

# mplayer 
function mp() {
	case $1 in
		music ) mplayer -shuffle $HOME/music/star/* ;;
	esac
}


function sync(){
#alias muywank="sudo mount -L uywankRoot /uywank; sudo mount -L uywankBoot /uywank/boot; sudo mount -L uywankUsr /uywank/usr; sudo mount -L uywankHome /uywank/home; sudo mount -L uywankBackup /uywank/backup"

#alias uuywank="sudo umount /uywank/home; sudo umount /uywank/usr; sudo umount /uywank/boot; sudo umount /uywank/backup; sudo umount /uywank"

#alias uywanksync="sudo rsync -avhAHXES --numeric-ids --delete  --exclude-from=$G_A/uywanksync_exclude --files-from=$G_A/uywanksync -r / /uywank"

#alias mywank="sudo mount -L ywankRoot /ywank; sudo mount -L ywankBoot /ywank/boot; sudo mount -L ywankUsr /ywank/usr; sudo mount -L ywankHome /ywank/home"

#alias uywank="sudo umount /ywank/home; sudo umount /ywank/usr; sudo umount /ywank/boot; sudo umount /ywank"
#alias ywanksync="sudo rsync -avhAHXES --numeric-ids --delete --delete-after  --exclude-from=$G_A/uywanksync_exclude --files-from=$G_A/uywanksync -r / /ywank"
}


# ¤go
function work(){
	case $1 in
		ssh )
			ssh deployer@218.108.75.212
			;;
	esac
}

# ¤ff ¤firefox
alias winecn='LANG=zh_CN.UTF-8 wine'
alias wineqq="wine ~/.wine/qq.exe"
alias ie="wine '/home/guten/.wine/drive_c/Program Files/Internet Explorer/IEXPLORE.exe'"
alias explorer="pacman"

alias thermal="acpi -t;sudo hddtemp /dev/sda"
alias cputhermal="acpi -t"
alias cpufreq="cpufreq-info"
alias off="sleep 2 && xset dpms force off"

function vm(){
	case $1 in
		xp ) qemu-kvm /vm/xp.img -m 256M -vga std -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
		xp2 ) qemu-kvm /vm/xp2.img -m 1G -vga std -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
		ubuntu ) qemu-kvm /vm/ubuntu.img -m 1G -vga vmware -enable-kvm -usb -usbdevice mouse -ctrl-grab $*[2,-1] ;;
	esac
}
vms=(xp xp3 ubuntu)
compdef "_describe vm vms" vm


function init(){
	ali_im &> /var/log/ali_im.log &
}


alias pdf=apvlv
alias chm=xchm

# ¤mount #{{{1
function umou(){
	case $1 in
		king ) umount /media/king; umount /media/kingc ;;
	uywank ) umount /uywank ;;
	camera ) umount /media/camera ;;
	esac
}
#}}}1

function volume() {
	case $1 in
		(on) amixer set Master unmute ;;
		(off) amixer set Master mute ;;
		(*) alsamixer -c 0 ;;
	esac
}

alias man3="man 3"
alias javascript="java -cp /usr/share/java/js.jar org.mozilla.javascript.tools.shell.Main -opt -1"

# vim: foldmethod=marker
