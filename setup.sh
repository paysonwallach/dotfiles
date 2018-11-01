#!/usr/bin/env bash -e

PWD = "$(pwd)"

# Ask for the administrator password upfront
echo "Enter sudo password:"
sudo -v

# Keep-alive: update existing sudo time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null

chflags hidden $PWD

"$PWD/symlink.sh"
"$PWD/config.sh"
"$PWD/install-development-tools.sh"
"$PWD/install-applications.sh"

echo Done!
echo Restarting shell...
exec "$(which $SHELL)" -l
