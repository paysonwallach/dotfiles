function hideHidden
    defaults write com.apple.finder AppleShowAllFiles NO
    killall Finder
end
