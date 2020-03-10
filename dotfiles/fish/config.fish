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

# --- environment ---
export RUBY_CONFIGURE_OPTS=--with-openssl-dir=(brew --prefix openssl@1.1)

# --- iTerm2 shell integration ---
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
