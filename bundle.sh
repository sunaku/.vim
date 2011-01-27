#!/bin/sh
# Installs or upgrades all bundles defined in bundle/ as necessary.

git submodule init
git submodule status | awk '/^-/ { print $2 }' | xargs -r git submodule update
git submodule foreach git pull origin master

rm -vrf bundle/snipMate/snippets/ # conflicts with bundle/0-snipMate/snippets/

cd bundle/
ruby get.rb
sh doc.sh
