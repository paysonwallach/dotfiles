#!/usr/bin/env bash -e

ROOT="$(pwd)"

# Ask for an administrator password upfront
echo "Enter sudo password: "
sudo -v

# Keep-alive: update existing sudo time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null

"$ROOT/system-preferences.sh"
"$ROOT/install-development-tools.sh"
"$ROOT/install-user-applications.sh"

echo Done!
echo Restarting shell...
exec "$(which $SHELL)" -l
