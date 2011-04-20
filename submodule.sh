#!/bin/sh
# install and upgrade git submodules
git submodule sync
git submodule init
git submodule status | awk '/^-/ { print $2 }' | xargs -r git submodule update
git submodule foreach git pull origin master
