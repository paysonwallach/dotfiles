#!/usr/bin/env bash -e

PWD = "$(pwd)"

"$PWD/symlink.sh"
"$PWD/config.sh"
"$PWD/install-development-tools.sh"
"$PWD/install-applications.sh"

echo Done!
echo Restarting shell...
exec "$(which $SHELL)" -l
