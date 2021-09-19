# --- aliases ---
if status --is-interactive
    if test -f "$HOME/.aliases"
        source "$HOME/.aliases"

        # export aliases for lazy-loading in child shells
        for alias in (grep -o "^alias \b\w+\b" "$HOME/.aliases" | cut -c 7-)
            funcsave $alias
        end
    end

    if test -f "$HOME/.functions.fish"
        source "$HOME/.functions.fish"

        # export functions for lazy-loading in child shells
        for func in (grep -o "function \b\w+\b" "$HOME/.aliases.fish" | cut -c 10-)
            funcsave $func
        end
    end
end

# source asdf
source "/opt/asdf-vm/asdf.fish"

# source bashhub
test -f "$HOME/.bashhub/bashhub.fish"; and source "$HOME/.bashhub/bashhub.fish"

# source grc
status --is-interactive; and test -f "/etc/grc.fish"; and source "/etc/grc.fish"

# source rbenv
status --is-interactive; and source (rbenv init -|psub)

# source zoxide
zoxide init fish | source
