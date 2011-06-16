function run() {
	case $1 in
		redmine ) sudo -u rails rvm 1.8.7 -S /srv/rails/redmine/script/server -e production -p 1026 0null & ;;
	 	firefox ) 
			case $2 in
				vimor ) firefox -p vimor -no-remote 0null & ;;
				mini ) firefox -p mini -no-remote 0null & ;;
				  * ) firefox -p default -no-remote $*[2,-1] &>/log/firefox & ;;
			esac ;;
		chromium ) 
			case $2 in
				gfw ) chromium  --proxy-server='http://localhost:8086' $*[3,-1] 0null & ;;
				dev ) chromium  --user-data-dir=~/.config/chromium/development $*[3,-1] 0null & ;;
				mini ) chromium  --user-data-dir=~/.config/chromium/mini $*[3,-1] 0null & ;;
				  * ) chromium $*[2,-1] &>/log/chromium & ;;
			esac ;;
		chm ) xchm $*[2,-1] 0null & ;;
		skype ) skype &>/log/skype & ;;
		pidgin ) pidgin &>/log/pidgin & ;;
		feixing ) linux-fetion 0null & ;;
		bt ) deluge &>/log/bt & ;;
		emule ) wine ~/.wine/drive_c/Program\ Files/easyMule/emule.exe 0null & ;;
		qq ) cd /home/guten/.qq/; ./qq 0null &;  cd - ;;
		office ) openoffice $*[2,-1] 0null & ;;
		dirstat ) kdirstat 0null & ;;
		pdf ) evince $*[2,-1] 0null & ;;
		music )
			case $2 in
				tag ) picard 0null & ;;
			esac ;;
		* ) $*[2,-1] 0null &;;
	esac
}

run_cmds=(redmine firefox chromium chm skype pidgin feixing bt emule qq office pdf dirstat music)
compdef "_describe run run_cmds" run

