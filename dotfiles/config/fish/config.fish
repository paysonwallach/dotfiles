# Launch tmux upon opening of new terminal
if status is-interactive
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end

#--- Aliases ---

# Dotdrop
alias dotdrop '/home/paysonwallach/.dotfiles/dotdrop.sh --cfg=/home/paysonwallach/.dotfiles/config.yaml'

# Trash
alias rm 'echo -e "This is not the command you\'re looking for.\n\nIf you\'re sure you\'d like to use \'rm\',\nprepend with \'command\'."; false'

#--- Environment ---

# Pyenv
set -x PYENV_ROOT $HOME/.pyenv

