#!/usr/bin/env bash -e

echo Configuring development tools...

# Check for Xcode Command Line Tools

if [[ $(xcode-select --version) ]]; then
  echo Xcode command tools already installed
else
  echo "Installing Xcode commandline tools..."
  $(xcode-select --install)
fi

# Check for Homebrew

if [[ $(brew --version) ]] ; then
    echo "Attempting to update Homebrew..."
    brew update
else
    echo "Attempting to install Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew update && brew cleanup

# Install Fira Code
brew tap caskroom/fonts
brew cask install font-fira-code

# Install Bazel dependencies

brew tap caskroom/versions
brew cask install java8

brew install \
    bazel \
    carthage \
    cocoapods \
    fish \
    git \
    python \
    wget

# Change shell to Fish

echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

chsh -s /usr/local/bin/fish

# Install applications

brew tap caskroom/cask
brew cask install \
    virtualbox \
