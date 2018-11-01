#!/usr/bin/env bash -e

mkdir -p $HOME/.config

ln -s $(pwd)/fish "$HOME/.config"
ln -s $(pwd)/fisher "$HOME/.config"
