#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# start "fish" if not already running
if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]; then
    exec fish
    return
fi

# set prompt
PS1='[\u@\h \W]\$ '

# source aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# source grc
[[ -s "/etc/grc.sh" ]] && source /etc/grc.sh

# source rbenv
eval "$(rbenv init -)"

# source zoxide
eval "$(zoxide init bash)"
