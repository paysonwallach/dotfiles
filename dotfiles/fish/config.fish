# launch tmux upon opening of new terminal
if status is-interactive
and not test -n "$SSH_TTY"
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end

# source Bashhub
if [ -f "$HOME/.bashhub/bashhub.fish" ]
    source "$HOME/.bashhub/bashhub.fish"
end

# source pyenv
status --is-interactive; and source (pyenv init -|psub)

# source virtualfish
eval (python3 -m virtualfish)

# source zoxide
zoxide init fish | source

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
set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

export RUBY_CONFIGURE_OPTS=--with-openssl-dir=(brew --prefix openssl@1.1)

# --- iTerm2 shell integration ---
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
