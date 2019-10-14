# Launch tmux upon opening of new terminal
if status is-interactive
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end

# Source virtualfish
eval (python3 -m virtualfish)


# --- Aliases ---

# Dotdrop
alias dotdrop '/home/paysonwallach/.dotfiles/dotdrop.sh --cfg=/home/paysonwallach/.dotfiles/config.yaml'


#--- Environment ---

# Pyenv
set -x PYENV_ROOT $HOME/.pyenv
