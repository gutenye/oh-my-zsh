function precmd(){
	[ -f /var/tmp/sysupgrade.notice ] && echo "you have upgrade the system."
}
