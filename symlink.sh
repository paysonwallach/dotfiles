#!/usr/bin/env bash -e

ROOT="$(pwd)"

mkdir -p "$HOME/.config"

ln -s $ROOT/bin "$HOME/.bin"
ln -s $ROOT/fish "$HOME/.config"
ln -s $ROOT/fisher "$HOME/.config"
