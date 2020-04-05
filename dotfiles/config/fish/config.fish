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

# --- aliases ---
if status is-login
    if test -f $HOME/.aliases
        source $HOME/.aliases

        # export aliases for lazy-loading in child shells
        for alias in (grep -o "^alias \b\w+\b" $HOME/.aliases | cut -c 7-)
            funcsave $alias
        end
    end

    if test -f $HOME/.functions.fish
        source $HOME/.functions.fish

        # export functions for lazy-loading in child shells
        for func in (grep -o "function \b\w+\b" $HOME/.aliases.fish | cut -c 10-)
            funcsave $func
        end
    end
end

# --- environment ---
nvm use default > /dev/null
