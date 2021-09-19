export BH_HOME_DIRECTORY=/home/paysonwallach/.bashhub/
export BH_URL=http://bashhub.paysonwallach.com
export GOPATH=/home/paysonwallach/.go/
export LIBVA_DRIVER_NAME=iHD

# pyenv
eval "$(pyenv init --path)"

if [ -n "$GTK_MODULES" ]; then
    GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
else
    GTK_MODULES="appmenu-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]; then
    UBUNTU_MENUPROXY=1
fi

export GTK_MODULES
export UBUNTU_MENUPROXY
