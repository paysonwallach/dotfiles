function ssh
    /usr/bin/ssh -t "$argv" "LANG=$LANG tmux attach || tmux new"
end
