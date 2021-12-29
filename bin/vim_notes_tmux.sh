if tmux has-session -t 'vim_notes' 2> /dev/null; then
    tmux attach -t 'vim_notes'
    exit 0
fi

tmux new -s "vim_notes" -d \;

#source custom vim
tmux send-keys -t vim_notes 'cp ~/.config/nvim/init.vim .vim.custom' C-m
tmux send-keys -t vim_notes 'cat .vim.custom.extra >> .vim.custom' C-m
tmux send-keys -t vim_notes 'alias vi="nvim -u .vim.custom"' C-m


#attach to tmux cornerstone window
tmux attach -t 'vim_notes'
