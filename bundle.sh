#!/bin/sh
# Installs and upgrades Vim scripts in the bundle/ directory as necessary.

git submodule sync
git submodule init
git submodule status | awk '/^-/ { print $2 }' | xargs -r git submodule update
git submodule foreach git pull origin master

# index help documentation in bundles
for dir in bundle/*/doc/; do
  vim -u NONE -c "helptags $dir" -c quit
done

# resolve conflicts between bundles
rm -rf bundle/snipMate/snippets/ # conflicts with bundle/0-snipMate/snippets/
