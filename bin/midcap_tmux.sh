if tmux has-session -t 'midcap' 2> /dev/null; then
    tmux attach -t 'midcap'
    exit 0
fi

tmux new -s "midcap" -d \; split-window -v \; select-pane -t 0 \;

#Tail logs
tmux send-keys -t midcap:0.0 'export MASTER="midcap-staging"' C-m
tmux send-keys -t midcap:0.0 'rs' C-m
tmux send-keys -t midcap:0.1 'export MASTER="midcap-staging"' C-m
tmux send-keys -t midcap:0.1 'cd hasura' C-m
tmux send-keys -t midcap:0.1 './docker-run.sh' C-m

#attach to tmux midcap window
tmux attach -t 'midcap'
