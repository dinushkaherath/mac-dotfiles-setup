#!/usr/bin/env bash

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
# shellcheck disable=SC2207
IFS=$'\n' && options=("New Session" "New Midcap" "New Cornerstone" "Kill all" $(tmux list-sessions -F "#S" 2>/dev/null))
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
	case $opt in
		"New Session")
			read -rp "Enter new session name: " SESSION_NAME
			tmux new -s "$SESSION_NAME"
			break
			;;
		"New Midcap")
			cd /Users/dinushkaherath/Developer/github/midcapops 
			~/bin/./midcap_tmux.sh
			break
			;;
		"New Cornerstone")
			cd /Users/dinushkaherath/Developer/github/cornerstone-api
			~/bin/./corner_tmux.sh
			break
			;;
		"Kill all")
			tmux kill-server
			break
			;;
		*)
			tmux attach-session -t "$opt"
			break
			;;
	esac
done
