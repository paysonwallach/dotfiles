# launch tmux upon opening of new terminal
if status is-interactive
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end

# source bashhub
if [ -f "$HOME/.bashhub/bashhub.fish" ]
    source "$HOME/.bashhub/bashhub.fish"
end

# source pyenv
status --is-interactive; and source (pyenv init -|psub)

# source virtualfish
eval (python3 -m virtualfish)

# source zoxide
zoxide init fish | source
