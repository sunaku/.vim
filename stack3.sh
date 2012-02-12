#!/bin/sh
# Reapplies the stacked three-branch architecture: master => config => bundle.

# abort if any shell commands fail
set -e

# ensure that working tree is clean
git rebase HEAD --quiet
git branch -v # for user's reference

# reapply stacked three-branch architecture
base=
for branch in master config bundle; do
  if test -n "$base"; then
    echo; echo; echo;
    git checkout $branch
    commit=$(git rev-parse --short HEAD)
    if ! git rebase --preserve-merges "$base" --quiet >/dev/null 2>&1; then
      while test -d .git/rebase-apply; do
        echo -n 'Skipping conflicting commit: '
        cat .git/rebase-apply/original-commit
        git rebase --skip
      done
      # show differences if conflicting
      if ! git diff --quiet; then
        git diff
      fi
    fi
  fi
  base=$branch
done
