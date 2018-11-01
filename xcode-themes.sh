#!/usr/bin/env bash -e

mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes

git clone https://github.com/paysonwallach/Material-Light-Theme-Xcode.git /tmp/material-light-theme

git clone https://github.com/sasikiran/Material-Theme-for-Xcode.git /tmp/material-dark-theme

cd /private/tmp

cp material-light-theme/Material\ Light.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes

cp material-dark-theme/MaterialTheme.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Material.xccolortheme

cp material-dark-theme/MaterialTheme\ Darker.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Material\ Dark.xccolortheme

cd ~/Library/Developer/Xcode/UserData/FontAndColorThemes

chmod +x Material\ Light.xccolortheme Material.xccolortheme Material\ Dark.xccolortheme
