#!/bin/sh
# Updates Vim scripts installed as Git submodules in this directory.

for submodule in */.git/..; do
  echo "$submodule" | sed 's,/.*,,'
  cd "$submodule"

    git pull origin master

  cd ..
  echo
done
