#!/bin/sh
# Clones or updates the Git repositories specified in `./**/*.get` files,
# starting from the most recently modified file down to the earliest one.

git ls-files -c -o | grep '\.get$' | xargs ls -t | while read get; do
  url=$(cat "$get")
  dir=${get%.get}
  echo -n "$dir => "
  if cd "$dir/.git/.." 2>/dev/null; then
    git remote set-url origin "$url"
    git pull origin
    cd - >/dev/null
  else
    git clone "$url" "$dir"
  fi
done
