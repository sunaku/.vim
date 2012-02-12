# sunaku.vim bootstrap (master branch)

Unlike most Vim configurations you find on the Internet, this one is modular:
*not* a single giant `vimrc` file!  May it help you journey the lands of Vim.

## Overview

Branches

* The **master** branch is a bare bones template for anyone to start with.

* The **config** branch adds my personal configuration of standard Vim.

* The **bundle** branch adds my chosen bundles and their configuration.

Bundles

* `**/*.get` specify the URLs of Git repositories to clone for your bundles.

* `bundle/*/` and `ftbundle/*/*/` are your bundles, according to [Unbundle].

Configuration

* `config.vim` activates your bundles and then loads your Vim configuration.

* `config/**/*.vim` is your Vim configuration, organized into files by topic.

## Prerequisites

* [Vim](http://www.vim.org/) 7.3 or newer

* [Git](http://git-scm.com/) 1.5 or newer

* [POSIX sh](http://pubs.opengroup.org/onlinepubs/009695399/utilities/sh.html)ell

[Unbundle]: https://github.com/sunaku/vim-unbundle

## Installing

Backup your configuration:

    mv ~/.vim ~/.vim.bak
    mv ~/.vimrc ~/.vimrc.bak

Install this configuration:

    git clone git://github.com/sunaku/.vim.git ~/.vim
    ln -s ~/.vim/config.vim ~/.vimrc

Select a Git branch to use:

    cd ~/.vim
    git checkout master  # bare bones
    git checkout config  # bare bones + my config
    git checkout bundle  # bare bones + my config + my bundles

Install bundles from `*.get` files:

    cd ~/.vim
    sh bundle.sh

## Bundling

Add bundle from *URL*:

    cd ~/.vim
    sh addnew.sh URL

Add ftbundle for *FILETYPE* from *URL*:

    cd ~/.vim
    sh addnew.sh URL FILETYPE

Remove bundle called *NAME* (regexp):

    cd ~/.vim
    sh remove.sh NAME

Remove ftbundle for *FILETYPE* called *NAME* (regexp):

    cd ~/.vim
    sh remove.sh FILETYPE/NAME

List bundles and ftbundles that lack corresponding `*.get` files:

    cd ~/.vim
    sh zombie.sh

## Locking

Lock a *BUNDLE* to a certain Git *COMMIT* to prevent it from being upgraded:

    cd BUNDLE
    git checkout COMMIT

Unlock a locked *BUNDLE* so that it can be upgraded again:

    cd BUNDLE
    git checkout master

## Upgrading

Upgrade the configuration framework:

    cd ~/.vim
    sh rebase.sh

Upgrade bundles from `*.get` files:

    cd ~/.vim
    sh bundle.sh

Do all this periodically via crontab(1):

    @daily cd ~/.vim && sh rebase.sh && sh bundle.sh

