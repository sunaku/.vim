# sunaku.vim configuration (config branch)

Unlike most Vim configurations you find on the Internet, this one is modular:
*not* a single giant `vimrc` file!  May it help you journey the lands of Vim.

> At long last, I have completely [switched from jEdit to Vim][1],
> and this is the Vim configuration that [made it all possible][2].
> ~sunaku, 24 December 2009, 3:17am PST

[1]: http://snk.tuxfamily.org/log/switching-from-jedit-to-vim.html
[2]: http://snk.tuxfamily.org/log/vim-script-management-system.html

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

* `config/color/*.vim` are configurations for the matching Vim color schemes.

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

## Using URxvt

If you use Vim in the URxvt terminal emulator, then load the following
snippet into xrdb(1) so you can use all the shortcuts defined in this
Vim configuration:

    ! emulate XTerm for proper recognition of key combinations in Vim
    !URxvt.keysym.Up              : \033[A  !breaks arrow keys in Vim
    !URxvt.keysym.Down            : \033[B  !breaks arrow keys in Vim
    !URxvt.keysym.Right           : \033[C  !breaks arrow keys in Vim
    !URxvt.keysym.Left            : \033[D  !breaks arrow keys in Vim
    !URxvt.keysym.Page_Up         : \033[5~ !breaks scrolling in URxvt
    !URxvt.keysym.Page_Down       : \033[6~ !breaks scrolling in URxvt
    !URxvt.keysym.Home            : \033[H  !breaks navigation in Vim
    !URxvt.keysym.End             : \033[F  !breaks navigation in Vim
    URxvt.keysym.S-Up             : \033[1;2A
    URxvt.keysym.S-Down           : \033[1;2B
    URxvt.keysym.S-Right          : \033[1;2C
    URxvt.keysym.S-Left           : \033[1;2D
    !URxvt.keysym.S-Page_Up       : \033[5$
    !URxvt.keysym.S-Page_Down     : \033[6$
    URxvt.keysym.S-Home           : \033[1;2H
    URxvt.keysym.S-End            : \033[1;2F
    URxvt.keysym.M-Up             : \033[1;3A
    URxvt.keysym.M-Down           : \033[1;3B
    URxvt.keysym.M-Right          : \033[1;3C
    URxvt.keysym.M-Left           : \033[1;3D
    URxvt.keysym.M-Page_Up        : \033[5;3~
    URxvt.keysym.M-Page_Down      : \033[6;3~
    URxvt.keysym.M-Home           : \033[1;3H
    URxvt.keysym.M-End            : \033[1;3F
    URxvt.keysym.M-S-Up           : \033[1;4A
    URxvt.keysym.M-S-Down         : \033[1;4B
    URxvt.keysym.M-S-Right        : \033[1;4C
    URxvt.keysym.M-S-Left         : \033[1;4D
    !URxvt.keysym.M-S-Page_Up     : captured by terminal for scrolling
    !URxvt.keysym.M-S-Page_Down   : captured by terminal for scrolling
    URxvt.keysym.M-S-Home         : \033[1;4H
    URxvt.keysym.M-S-End          : \033[1;4F
    URxvt.keysym.C-Up             : \033[1;5A
    URxvt.keysym.C-Down           : \033[1;5B
    URxvt.keysym.C-Right          : \033[1;5C
    URxvt.keysym.C-Left           : \033[1;5D
    URxvt.keysym.C-Page_Up        : \033[5;5~
    URxvt.keysym.C-Page_Down      : \033[6;5~
    URxvt.keysym.C-Home           : \033[1;5H
    URxvt.keysym.C-End            : \033[1;5F
    URxvt.keysym.C-S-Up           : \033[1;6A
    URxvt.keysym.C-S-Down         : \033[1;6B
    URxvt.keysym.C-S-Right        : \033[1;6C
    URxvt.keysym.C-S-Left         : \033[1;6D
    !URxvt.keysym.C-S-Page_Up     : \033[5;5~
    !URxvt.keysym.C-S-Page_Down   : \033[6;5~
    URxvt.keysym.C-S-Home         : \033[1;6H
    URxvt.keysym.C-S-End          : \033[1;6F
    URxvt.keysym.M-C-Up           : \033[1;7A
    URxvt.keysym.M-C-Down         : \033[1;7B
    URxvt.keysym.M-C-Right        : \033[1;7C
    URxvt.keysym.M-C-Left         : \033[1;7D
    URxvt.keysym.M-C-Page_Up      : \033[5;7~
    URxvt.keysym.M-C-Page_Down    : \033[6;7~
    URxvt.keysym.M-C-Home         : \033[1;7H
    URxvt.keysym.M-C-End          : \033[1;7F
    URxvt.keysym.M-C-S-Up         : \033[1;8A
    URxvt.keysym.M-C-S-Down       : \033[1;8B
    URxvt.keysym.M-C-S-Right      : \033[1;8C
    URxvt.keysym.M-C-S-Left       : \033[1;8D
    !URxvt.keysym.M-C-S-Page_Up   : \033[5;7~
    !URxvt.keysym.M-C-S-Page_Down : \033[6;7~
    URxvt.keysym.M-C-S-Home       : \033[1;8H
    URxvt.keysym.M-C-S-End        : \033[1;8F

## References

* http://www.vi-improved.org/vimrc.php
* http://vim.wikia.com/wiki/Example_vimrc
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
* http://stackoverflow.com/questions/tagged/vim
* http://items.sjbach.com/319/configuring-vim-right
* http://push.cx/2008/256-color-xterms-in-ubuntu
* http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
* http://vim.wikia.com/wiki/Single_tags_file_for_a_source_tree
* http://vimcasts.org/episodes/bubbling-text/
