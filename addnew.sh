#!/bin/sh
# Adds a new, appropriately named bundle to your collection.
# If FILETYPE is given, the bundle is put inside ftbundle/.
#
# Usage: addnew.sh BUNDLE_URL [FILETYPE]

test $# -lt 1 && exit 1
url=$1
fty=$2

get=${url##*/}
get=${get%.git}
get=${get%.vim} # remove ".vim" suffixes found on Vim scripts
get=${get#vim-} # remove "vim-" prefixes found on GitHub
get=${get%-vim} # remove "-vim" suffixes found on GitHub

test -n "$fty" && dir="ftbundle/$fty" || dir="bundle"
mkdir -p "$dir"

get="$dir/$get.get"
echo "$url" > "$get"
ls "$get"
