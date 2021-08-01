if tmux has-session -t 'midcap' 2> /dev/null; then
    tmux attach -t 'midcap'
    exit 0
fi

tmux new -s "midcap" -d \; split-window -h \; split-window -h \; select-layout even-horizontal \; split-window -v \; select-pane -t 0 \;

#Tail logs
tmux send-keys -t midcap:0.2 'rails s' C-m
tmux send-keys -t midcap:0.3 'cd hasura' C-m
tmux send-keys -t midcap:0.3 'clear' C-m
tmux send-keys -t midcap:0.3 './docker-run.sh' C-m

#attach to tmux midcap window
tmux attach -t 'midcap'
