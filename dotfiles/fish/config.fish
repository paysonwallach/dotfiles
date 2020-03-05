# launch tmux upon opening of new terminal
if status is-interactive
and not test -n "$SSH_TTY"
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end

# source pyenv
status --is-interactive; and source (pyenv init -|psub)

# source virtualfish
eval (python3 -m virtualfish)


# --- aliases ---

# dotdrop
alias dotdrop "$HOME/.dotfiles/dotdrop.sh"


# --- iTerm2 shell integration ---
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
