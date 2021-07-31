if tmux has-session -t 'midcap' 2> /dev/null; then
    tmux attach -t midcap
    exit 0
fi

tmux new -s midcap -d

#Create 8 horizontal panes
tmux split-window -h -t midcap
tmux split-window -h -t midcap
tmux select-layout even-horizontal -t midcap
tmux split-window -v -t midcap
tmux select-pane -t 0 -t midcap

#Tail logs
tmux send-keys -t midcap:0.0 'j midc' C-m
tmux send-keys -t midcap:0.0 'clear' C-m
tmux send-keys -t midcap:0.1 'j midc' C-m
tmux send-keys -t midcap:0.1 'clear' C-m
tmux send-keys -t midcap:0.2 'j midc' C-m
tmux send-keys -t midcap:0.2 'clear' C-m
tmux send-keys -t midcap:0.2 'rails s' C-m
tmux send-keys -t midcap:0.3 'j midc' C-m
tmux send-keys -t midcap:0.3 'cd hasura' C-m
tmux send-keys -t midcap:0.3 'clear' C-m
tmux send-keys -t midcap:0.3 './docker-run.sh' C-m

#attach to tmux midcap window
tmux attach -t midcap
