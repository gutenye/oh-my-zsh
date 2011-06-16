# taw is testawesome
# taw nil
# 		guten/rc.lua
function taw() {
	configfile="rc.lua"
	if [[ -n $2 ]] then
		configfile=$2
	fi

	killall Xephyr;killall Xephyr;
	Xephyr -ac -br -noreset -fullscreen :1 &
	sleep 2
	DISPLAY=:1.0 awesome --config $configfile
}
