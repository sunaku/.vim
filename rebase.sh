#!/bin/sh
# Replays local commits atop the newest changes from upstream.

# abort if any shell commands fail
set -e

# ensure that working tree is clean
git rebase HEAD --quiet

# download new commits from upstream
remote=upstream
git remote show $remote >/dev/null 2>&1 ||
git remote add $remote git://github.com/sunaku/.vim.git
git fetch $remote

# use newest version of this script
if ! git diff --quiet $remote/master -- "$0"; then
  eval "$(git show $remote/master:$0)"
  exit $?
fi

# rebase current branch atop upstream
commit=$(git rev-parse --short HEAD)
branch=$(git name-rev --name-only HEAD)
if ! git rebase "$remote/$branch" --quiet >/dev/null; then
  cat <<EOF

    +-------------------------IMPORTANT!----------------------------+
    |                                                               |
    | Some of YOUR COMMITS WERE SET ASIDE to solve merge conflicts: |
    | empty commits labeled as "fixup!" have now taken their place. |
    |                                                               |
    | But rest assured, THEY STILL EXIST in Git history at $commit, |
    | and your working tree has all changes from those commits too! |
    |                                                               |
    | You can UNDO THE UPGRADE at any time by running this command: |
    |                 git reset --hard $commit                      |
    |                                                               |
    +-------------------------IMPORTANT!----------------------------+

EOF
  # "solve" all merge conflicts by setting conflicting commits aside
  while test -d .git/rebase-apply; do
    conflict=$(cat .git/rebase-apply/original-commit)
    headline=$(head -1 .git/rebase-apply/msg-clean)

    # skip conflicting commits from the sunaku.vim distribution itself
    if ! git branch -r --contains $conflict | fgrep -q '/HEAD -> '; then
      # in place of the conflicting commit, record an empty commit whose
      # message contains the changes introduced by the conflicting commit
      git reset --mixed --quiet # empty the index so we can make a commit
      git commit --allow-empty --reuse-message=$conflict --quiet
      {
        echo "fixup! $(git rev-parse --short $conflict) $headline"
        echo # blank line after message headline, per Git convention
        git diff -U9
      } |
      git commit --amend --allow-empty --file=-
    fi

    git rebase --skip >/dev/null 2>&1 || true
  done
fi
