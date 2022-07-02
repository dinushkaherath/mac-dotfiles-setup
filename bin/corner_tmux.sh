if tmux has-session -t 'cornerstone' 2> /dev/null; then
    tmux attach -t 'cornerstone'
    exit 0
fi

tmux new -s "cornerstone" -d \; split-window -v \; select-pane -t 0 \;

#Tail logs
tmux send-keys -t cornerstone:0.0 'export DOCKER_EXEC="cornerstone-api-rails_api-1"' C-m
tmux send-keys -t cornerstone:0.1 'export DOCKER_EXEC="cornerstone-api-rails_api-1"' C-m

#attach to tmux cornerstone window
tmux attach -t 'cornerstone'
