#!/usr/bin/env bash -e

echo "Configuring development tools..."

# Check for Xcode Command Line Tools
if [[ $(xcode-select --version) ]]; then
  echo "Xcode command tools already installed"
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

brew install \
    bat \
    carthage \
    cmake \
    cocoapods \
    fish \
    git-lfs \
    gotop \
    imagemagick \
    mas \
    neovim \
    nvm \
    pwgen \
    pyenv \
    ruby \
    tmux \
    wget

brew tap caskroom/cask
brew tap caskroom/fonts

brew cask install \
    aerial \
    atom \
    docker \
    caskroom/fonts/font-fira-code \
    caskroom/fonts/font-hasklig \
    virtualbox

# Change shell to fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells

chsh -s /usr/local/bin/fish

# Install Xcode themes
mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes

git clone https://github.com/paysonwallach/Material-Light-Theme-Xcode.git /tmp/material-light-theme

git clone https://github.com/sasikiran/Material-Theme-for-Xcode.git /tmp/material-dark-theme

cd /tmp

cp material-light-theme/Material\ Light.xccolortheme  ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Material\ \(Light\).xccolortheme

cp material-dark-theme/MaterialTheme.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Material\ \(Dark\).xccolortheme

cd ~/Library/Developer/Xcode/UserData/FontAndColorThemes

chmod +x Material\ \(Light\).xccolortheme Material\ \(Dark\).xccolortheme
