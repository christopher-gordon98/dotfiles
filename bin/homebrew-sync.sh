#!/bin/bash

DOTDIR="$HOME/.dotfiles"

# source home brew packages and install missing packages
source $DOTDIR/bin/package-brew.sh
# update home brew packages file
brew list | sort | xargs which | grep 'local' | sed 's/\/.*\//brew install /' > $DOTDIR/bin/package-brew.sh
