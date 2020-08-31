# launch tmux upon opening of new terminal
if status is-interactive
and not test -n "$SSH_TTY"
and not set -q TMUX
    command tmux new-session \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
    command tmux attach
end

# source bashhub
[ -f "$HOME/.bashhub/bashhub.fish" ]; and source "$HOME/.bashhub/bashhub.fish"

# source grc
test -f "/etc/grc.fish"; and source "/etc/grc.fish"

# source pyenv
status --is-interactive; and source (pyenv init -|psub)

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
set -x LC_ALL en_GB.UTF-8
{%@@ if profile == "Paysons-Mac-Pro" @@%}
set -x RUBY_CONFIGURE_OPTS=--with-openssl-dir=(brew --prefix openssl@1.1)
{%@@ endif @@%}

status --is-interactive; and nvm use default > /dev/null

# --- iTerm2 shell integration ---
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
