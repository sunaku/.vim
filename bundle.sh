#!/bin/sh
# Installs or upgrades all bundles defined in bundle/ as necessary.

git submodule init
git submodule | awk '/^-/ { print $2 }' | xargs -r git submodule update

cd bundle/
ruby get.rb
sh git.sh
sh doc.sh
