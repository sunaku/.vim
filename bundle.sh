#!/bin/sh
# Installs or upgrades all bundles defined in bundle/ as necessary.

git submodule init
git submodule status | awk '/^-/ { print $2 }' | xargs -r git submodule update
git submodule foreach git pull origin master

cd bundle/
ruby get.rb
sh doc.sh

# remove because it conflicts with the better snippets in bundle/0-snipMate
rm -rf bundle/snipMate/snippets
