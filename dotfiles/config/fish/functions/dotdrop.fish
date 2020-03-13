function dotdrop
    set -lx PATH "$HOME/.local/share/virtualenvs/dotdrop/bin" $PATH
    "$HOME/.dotfiles/dotdrop.sh" $argv -c "$HOME/.dotfiles/config.yaml"
end
