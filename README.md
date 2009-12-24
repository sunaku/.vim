# A modular Vim configuration

Unlike most Vim configurations you find online, this one is _modular_: it's
*not* a monolithic `vimrc` file!  May it help you journey the lands of Vim.

## Features

* Modularity of bundles, filetypes, colorschemes, and Vim settings.

* Lazy loading of filetype-specific bundles to start Vim up quickly.

* Parallel installation and updating of bundles from Git repositories.

* Easy upgrades with intelligent and automated Git conflict resolution.

* Shell scripts for bundle management: insert, delete, rename, and more.

## Overview

Branches

* The **[master]** branch is a bare bones template for anyone to start with.
[master]: https://github.com/sunaku/.vim/tree/master#readme

* The **[config]** branch adds my personal configuration of the standard Vim.
[config]: https://github.com/sunaku/.vim/tree/config#readme

* The **[bundle]** branch adds my chosen bundles and my configuration thereof.
[bundle]: https://github.com/sunaku/.vim/tree/bundle#readme

* The **[spacey]** branch adds an enhanced Space leader key, like [Spacemacs].
[spacey]: https://github.com/sunaku/.vim/tree/spacey#readme
[Spacemacs]: https://github.com/syl20bnr/spacemacs#readme

Bundles

* `**/*.get` files specify URLs of Git repositories to clone for your bundles.

* `bundle/*/*/` directories are eagerly loaded Vim scripts; see [Unbundle].

* `ftbundle/*/*/` directories are lazily loaded, filetype-specific bundles.

Configuration

* `plugin/**/*.vim` configure Vim _before_ it finishes starting up.

* `bundle/*/*.vim` configure your bundles _before_ they are loaded.

* `ftbundle/*/*.vim` configure your ftbundles _before_ they are loaded.

* `ftplugin/{*,/*}.vim` configure your filetypes _when_ they are loaded.

* `after/plugin/**/*.vim` configure Vim _after_ it finishes starting up.

## Requirements

* [Vim](http://www.vim.org/) 7+ or [NeoVim](https://neovim.io/) 0.1+

* [Git](http://git-scm.com/) 1.5+

* [POSIX shell](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html)

  Special note to Microsoft Windows users: simply

  * replace `~/.vim` with `%USERPROFILE%\vimfiles`
  * replace `~/.vimrc` with `%USERPROFILE%\_vimrc`

  in all commands listed throughout this document.

* [xargs](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/xargs.1)
  with support for the `-r` command-line option:

    > Do not run the command if there are no arguments.  Normally the
    > command is executed at least once even if there are no arguments.

[Unbundle]: https://github.com/sunaku/vim-unbundle#readme

## Installing

Backup your configuration:

    mv ~/.vim ~/.vim.bak
    mv ~/.config/nvim ~/.config/nvim.bak # for NeoVim

Install this configuration:

    git clone https://github.com/sunaku/.vim.git ~/.vim
    ln -s ~/.vim ~/.config/nvim  # for NeoVim
    cd ~/.vim

Select a Git branch to use:

    ./select-config master    # bare bones
    ./select-config config    # bare bones + my config
    ./select-config bundle    # bare bones + my config + my bundles
    ./select-config spacey    # bare bones + my config + my bundles + space

## Helping

Get help on how to get help:

    ./help-usage

Get help on using a provided *SCRIPT*:

    ./help-usage SCRIPT

## Bundling

Add bundle from *URL* under *CATEGORY*:

    ./insert-bundle URL bundle/CATEGORY

Add bundle from *URL* under *CATEGORY* with *BUNDLE_NAME*:

    ./insert-bundle URL bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from *URL* for *FILETYPE*:

    ./insert-bundle URL ftbundle/FILETYPE

Add ftbundle from *URL* for *FILETYPE* with *BUNDLE_NAME*:

    ./insert-bundle URL ftbundle/FILETYPE/BUNDLE_NAME

Add bundle from Github *USER*/*REPO* under *CATEGORY*:

    ./insert-bundle USER/REPO bundle/CATEGORY

Add bundle from Github *USER*/*REPO* under *CATEGORY* with *BUNDLE_NAME*:

    ./insert-bundle USER/REPO bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from Github *USER*/*REPO* for *FILETYPE*:

    ./insert-bundle USER/REPO ftbundle/FILETYPE

Add ftbundle from Github *USER*/*REPO* for *FILETYPE* with *BUNDLE_NAME*:

    ./insert-bundle USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

Move or rename bundles with names matching *BUNDLE_NAME* (regexp):

    ./rename-bundles BUNDLE_NAME

Remove bundles with names matching *BUNDLE_NAME* (regexp):

    ./delete-bundles BUNDLE_NAME

List bundles and ftbundles that lack corresponding `*.get` files:

    ./list-untracked-bundles

Delete bundles and ftbundles that lack corresponding `*.get` files:

    ./delete-untracked-bundles        # asks you for confirmation
    ./delete-untracked-bundles -f     # no confirmation; force it

Insert untracked bundles that have corresponding `*.get` files:

    ./insert-untracked-bundles        # asks you for confirmation
    ./insert-untracked-bundles -f     # no confirmation; force it

## Updating

Update installed bundles and ftbundles:

    ./update-bundles

Update this Vim configuration framework:

    ./update-config

Do all that conveniently in one command:

    ./update

Do all that periodically via crontab(1):

    @daily cd ~/.vim && ./update -f

### Locking

Lock a *BUNDLE* to a certain Git *COMMIT* to prevent it from being updated:

    cd BUNDLE
    git checkout COMMIT

Unlock a locked *BUNDLE* so that it can be updated again:

    cd BUNDLE
    git checkout master

## References

* http://learnvimscriptthehardway.stevelosh.com/chapters/42.html
