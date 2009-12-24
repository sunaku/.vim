# A modular Vim configuration

Unlike most Vim configurations you find online, this one is _modular_: it's
*not* a single giant `vimrc` file!  May it help you journey the lands of Vim.

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

## Prerequisites

* [Vim](http://www.vim.org/) 7 or newer

* [Git](http://git-scm.com/) 1.5 or newer

* [POSIX shell](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html)

  Special note to Microsoft Windows users: simply

  * replace `~/.vim` with `%USERPROFILE%\vimfiles`
  * replace `~/.vimrc` with `%USERPROFILE%\_vimrc`

  in all commands listed throughout this document.

[Unbundle]: https://github.com/sunaku/vim-unbundle#readme

## Installing

Backup your configuration:

    mv ~/.vim ~/.vim.bak

Install this configuration:

    git clone https://github.com/sunaku/.vim.git ~/.vim

Select a Git branch to use:

    cd ~/.vim
    git checkout master                   # bare bones
    git checkout -b config origin/config  # bare bones + my config
    git checkout -b bundle origin/bundle  # bare bones + my config + my bundles

Install bundles and ftbundles from `*.get` files:

    ./update

## Bundling

Add bundle from *URL* under *CATEGORY*:

    ./insert URL bundle/CATEGORY

Add bundle from *URL* under *CATEGORY* with *BUNDLE_NAME*:

    ./insert URL bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from *URL* for *FILETYPE*:

    ./insert URL ftbundle/FILETYPE

Add ftbundle from *URL* for *FILETYPE* with *BUNDLE_NAME*:

    ./insert URL ftbundle/FILETYPE/BUNDLE_NAME

Add bundle from Github *USER*/*REPO* under *CATEGORY*:

    ./insert USER/REPO bundle/CATEGORY

Add bundle from Github *USER*/*REPO* under *CATEGORY* with *BUNDLE_NAME*:

    ./insert USER/REPO bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from Github *USER*/*REPO* for *FILETYPE*:

    ./insert USER/REPO ftbundle/FILETYPE

Add ftbundle from Github *USER*/*REPO* for *FILETYPE* with *BUNDLE_NAME*:

    ./insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

Move or rename a bundle named *BUNDLE_NAME* (regexp):

    ./rename BUNDLE_NAME

Remove a bundle named *BUNDLE_NAME* (regexp):

    ./delete BUNDLE_NAME

Remove a *FILETYPE* ftbundle named *BUNDLE_NAME* (regexp):

    ./delete FILETYPE/BUNDLE_NAME

List bundles and ftbundles that lack corresponding `*.get` files:

    ./scraps

Delete bundles and ftbundles that lack corresponding `*.get` files:

    ./clean        # asks you for confirmation
    ./clean -f     # no confirmation; force it

## Updating

Update installed bundles and ftbundles:

    ./update

Update this Vim configuration framework:

    ./rebase

Do all this periodically via crontab(1):

    @daily cd ~/.vim && ./rebase && ./clean -f && ./update

### Locking

Lock a *BUNDLE* to a certain Git *COMMIT* to prevent it from being updated:

    cd BUNDLE
    git checkout COMMIT

Unlock a locked *BUNDLE* so that it can be updated again:

    cd BUNDLE
    git checkout master

## References

* http://learnvimscriptthehardway.stevelosh.com/chapters/42.html
