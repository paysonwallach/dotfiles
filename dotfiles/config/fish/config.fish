# Launch tmux upon opening of new terminal
if status is-interactive
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end


# --- Aliases ---

# Dotdrop
alias dotdrop $HOME/.dotfiles/dotdrop.sh


# --- iTerm2 Shell Integration ---
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
