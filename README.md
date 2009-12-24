# A [modular][] (Neo)Vim configuration!

Nearly every (Neo)Vim configuration you find online is composed of a single,
giant `vimrc` file.  But _this one is different_: it's [modular], relying on
(Neo)Vim's behavior of loading all `plugin/**/*.vim` files on startup to
cleanly partition your settings, mappings, packages, and other configuration
into separate files that each focus on a single topic and _do one thing well_.

## Features

* Modularity of packages, filetypes, colorschemes, and Vim settings.

* Lazy loading of filetype-specific packages to start Vim up quickly.

* Parallel installation and updating of packages from Git repositories.

* Easy upgrades with intelligent and automated Git conflict resolution.

* Shell scripts for package management: insert, delete, rename, and more.

## Organization

<!-- vim-markdown-toc GFM -->

* [Branches](#branches)
* [Scripts](#scripts)
* [Packages](#packages)
* [Configs](#configs)
* [Dependencies](#dependencies)
* [Installation](#installation)
* [Usage](#usage)
    * [Bundling](#bundling)
    * [Updating](#updating)
    * [Tracking](#tracking)
    * [Locking](#locking)
* [Shortcuts](#shortcuts)
    * [Control](#control)
    * [Selection](#selection)
    * [Clipboard](#clipboard)
* [Manuals](#manuals)
    * [bin/clean](#binclean)
    * [bin/delete](#bindelete)
    * [bin/insert](#bininsert)
    * [bin/locate](#binlocate)
    * [bin/orphans](#binorphans)
    * [bin/rebase](#binrebase)
    * [bin/rebase-autocon](#binrebase-autocon)
    * [bin/rebase-stacked](#binrebase-stacked)
    * [bin/rename](#binrename)
    * [bin/rename-editor](#binrename-editor)
    * [bin/rename-fromto](#binrename-fromto)
    * [bin/setup](#binsetup)
    * [bin/shortcuts](#binshortcuts)
    * [bin/update](#binupdate)
    * [bin/usage](#binusage)
    * [bin/usage-readme](#binusage-readme)
* [References](#references)
* [License](#license)

<!-- vim-markdown-toc -->

### Branches

* The **[origin]** branch is a "bare bones" template for anyone to start with.

* The **[basics]** branch is a rudimentary configuration of the Standard Vim.

* The **[qwerty]** branch is an enhanced configuration meant for QWERTY typists.

* The **[dvorak]** branch is an optimized configuration meant for Dvorak typists
  --- those who [type in Dvorak]( http://www.dvzine.org/zine/01-toc.html ).

* The **[engram]** branch is an optimized configuration meant for Engram typists
  --- those who type in [Arno's Engram keyboard layout]( https://engram.dev ).

* The **[master]** branch is the frontier, where I experiment with new plugins.

[origin]: https://github.com/sunaku/.vim/tree/origin#readme
[basics]: https://github.com/sunaku/.vim/tree/basics#readme
[qwerty]: https://github.com/sunaku/.vim/tree/qwerty#readme
[dvorak]: https://github.com/sunaku/.vim/tree/dvorak#readme
[engram]: https://github.com/sunaku/.vim/tree/engram#readme
[master]: https://github.com/sunaku/.vim/tree/master#readme

### Scripts

* `bin/*` scripts automate common tasks.  See below for their usage manuals.

### Packages

* `**/*.get` files specify URLs of Git repositories to clone for your packages.

* `**/*.set` files specify branch names or commit SHAs to check out from Git.

* `**/*.run` files specify shell commands to run after updating your packages.

* `pack/*/start/*/` directories are packages that Vim eagerly loads on start.

* `pack/*/opt/*=*/` directories are lazily loaded, filetype-specific packages.

### Configs

* `plugin/**/*.vim` configure Vim _before_ it finishes starting up.

* `pack/*/*/*.vim` configure your packages _before_ they are loaded.

* `ftplugin/{*,/*}.vim` configure your filetypes _when_ they are loaded.

* `after/colors/*.vim` configure your colorschemes _after_ they are applied.

* `after/plugin/**/*.vim` configure Vim _after_ all of the above is finished.

## Dependencies

* [Vim](http://www.vim.org/) 7+ or [NeoVim](https://neovim.io/) 0.1+

* [Git](http://git-scm.com/) 1.5+

* [POSIX](http://pubs.opengroup.org/onlinepubs/9699919799/) environment
  (Linux, BSD, MacOSX, etc.)

    Special note to Microsoft Windows users: simply

    * replace `~/.vim` with `%USERPROFILE%\vimfiles`
    * replace `~/.vimrc` with `%USERPROFILE%\_vimrc`

    in all commands listed throughout this document.

* [xargs](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/xargs.1)
  with support for the `-r` command-line option:

    > Do not run the command if there are no arguments.  Normally the
    > command is executed at least once even if there are no arguments.

[Unbundle]: https://github.com/sunaku/vim-unbundle

## Installation

Backup your configuration:

    mv ~/.vim ~/.vim.bak
    mv ~/.config/nvim ~/.config/nvim.bak # for NeoVim

Install this configuration:

    git clone https://github.com/sunaku/.vim.git ~/.vim
    ln -s ~/.vim ~/.config/nvim  # for NeoVim
    cd ~/.vim
    bin/setup

Select a Git branch to use:

    bin/setup origin  # template
    bin/setup basics  # template + basics
    bin/setup qwerty  # template + basics + my flair
    bin/setup dvorak  # template + basics + my flair + dvorak
    bin/setup engram  # template + basics + my flair + engram
    bin/setup master  # template + basics + my flair + engram + new stuff

## Usage

See usage information:

    bin/usage

See usage information for provided *SCRIPT*:

    bin/usage SCRIPT

### Bundling

Add package from *URL* or Github *USER*/*REPO* under *CATEGORY*:

    bin/insert URL CATEGORY
    bin/insert USER/REPO CATEGORY

Add package from *URL* or Github *USER*/*REPO* under *CATEGORY* with *PACKAGE_NAME*:

    bin/insert URL CATEGORY/PACKAGE_NAME
    bin/insert USER/REPO CATEGORY/PACKAGE_NAME

Add ftpackage from *URL* or Github *USER*/*REPO* for *FILETYPE*:

    bin/insert URL FILETYPE=
    bin/insert USER/REPO FILETYPE=

Add ftpackage from *URL* or Github *USER*/*REPO* for *FILETYPE* with *PACKAGE_NAME*:

    bin/insert URL FILETYPE=PACKAGE_NAME
    bin/insert USER/REPO FILETYPE=PACKAGE_NAME

Rename packages with names matching *PACKAGE_NAME* regular expression:

    bin/rename PACKAGE_NAME

Rename any/all packages flexibly from the comfort of Vim:

    bin/rename-editor PACKAGE_NAME

Rename a `*.get` file from its current name to a new one:

    bin/rename-fromto CURRENT_GET_FILE NEW_GET_FILE

Delete packages with names matching *PACKAGE_NAME* regular expression:

    bin/delete PACKAGE_NAME

Lists untracked `*.get` files and packages lacking `*.get` files:

    bin/orphans

Deletes untracked `*.get` files and packages lacking `*.get` files:

    bin/clean        # asks you for confirmation
    bin/clean -f     # no confirmation; force it

### Updating

Update installed packages:

    bin/update

Update this Vim configuration framework:

    bin/rebase      # asks to confirm bin/clean
    bin/rebase -f   # no confirmation; force it

Do all that periodically via crontab(1):

    @daily cd ~/.vim && bin/rebase -f && bin/update

### Tracking

Track a certain Git *BRANCH* by creating a `*.set` file for your *PACKAGE*:

    echo BRANCH > PACKAGE.set

Remove *BRANCH* tracking for your *PACKAGE* by deleting its `*.set` file:

    rm PACKAGE.set

### Locking

Lock a *PACKAGE* to a certain Git *COMMITISH* to prevent it from being updated:

    cd PACKAGE
    git checkout COMMITISH

Unlock a locked *PACKAGE*, so it can be updated, by checking out its `master`:

    cd PACKAGE
    git checkout master

## Shortcuts

This branch of the Vim configuration defines the following shortcuts.

### Control

* Run `stty -ixon` before starting Vim to use `<C-S>` and `<C-Q>` keys.

* `<C-L>` clears search highlighting; recalculates hunks when diffing.

### Selection

* `gV` visually selects the most recently pasted text.
* `gn` selects the nearest search result after the cursor.
* `gN` selects the nearest search result before the cursor.

### Clipboard

* `Y` yanks from cursor to end of line, like Vim's native `C` and `D` keys.

## Manuals

The usage manual for each script is reproduced here, for your convenience.

### bin/clean

Deletes untracked `*.get` files and packages lacking `*.get` files.
If a REGEX is provided, it will filter the candidates for deletion.

    Usage: bin/clean [-f] [OPTIONS_FOR_GREP...] [REGEX]
    Usage: bin/clean        # asks you for confirmation
    Usage: bin/clean -f     # no confirmation; force it

### bin/delete

Deletes existing packages whose names match the given regular expression.

    Usage: bin/delete [OPTIONS_FOR_GREP...] PACKAGE_NAME_REGEXP

### bin/insert

Inserts a new package, optionally named PACKAGE_NAME, into the given CATEGORY.
You can specify USER/REPO in place of URL to insert from GitHub repositories.

    Usage: bin/insert [URL|USER/REPO] CATEGORY/[FILETYPE=][PACKAGE_NAME]

### bin/locate

Finds all known and untracked '*.get' files.

    Usage: bin/manifest [OPTIONAL_FILTER_REGEXP]

### bin/orphans

Lists untracked `*.get` files and packages lacking `*.get` files.

    Usage: bin/orphans

### bin/rebase

Replays local commits on top of the newest changes from upstream.

    Usage: bin/rebase      # asks to confirm bin/clean
    Usage: bin/rebase -f   # no confirmation; force it

### bin/rebase-autocon

    Usage: git-rebase-autocon [TARGET] [ARGUMENTS_FOR_GIT_REBASE...]

Rebases the given TARGET while automatically resolving conflicts
by substituting empty-tree commits labeled "fixup!" that log all
conflicting hunks in their commit messages in git-diff(1) format.

If TARGET is not specified, the upstream tracking branch is used.
Optional ARGUMENTS_FOR_GIT_REBASE... are passed to git-rebase(1).

Documented at <https://sunaku.github.io/git-rebase-autocon.html>

### bin/rebase-stacked

Rebases the main branches, going from conventional to divergent.

### bin/rename

Renames existing packages whose names match the given regular expression.

    Usage: bin/rename [OPTIONS_FOR_GREP...] PACKAGE_NAME_REGEXP

At the prompt, edit the package location and press ENTER to rename it so.
If you no longer wish to rename the package, just press ENTER to skip it.
If you made a mistake and want to abort the rename, press Control and C.

### bin/rename-editor

Lets you rename all *.get files in one fell swoop, from the comfort of Vim.

    Usage: bin/rename-editor

The editor will present you with 3 split windows (left, middle, and right):
1. The left window lists the current names for your reference (read-only)
2. The middle window lists the current names for you to rename (writable)
3. The right window lists the default names for your reference (read-only)

Edit the names in the middle window and then save the file before exiting.
To cancel or avoid performing any renames, exit the editor without saving.

Note: DO NOT change the order or amount of lines presented in the editor!

### bin/rename-fromto

Renames the given *.get file and all associated files to the new name.

    Usage: bin/rename-fromto CURRENT_GET_FILE NEW_GET_FILE

### bin/setup

Activates the given BRANCH and installs any bundles it defines.

    Usage: bin/setup [BRANCH]

    Usage: bin/setup origin  # template
    Usage: bin/setup basics  # template + basics
    Usage: bin/setup qwerty  # template + basics + my flair
    Usage: bin/setup dvorak  # template + basics + my flair + dvorak
    Usage: bin/setup engram  # template + basics + my flair + engram
    Usage: bin/setup master  # template + basics + my flair + engram + new stuff

### bin/shortcuts

Lists all <Space> shortcuts available in this Vim configuration.

### bin/update

    Usage: bin/update [BUNDLE_NAME|DIRECTORY|GET_FILE]...
    Usage: env UPDATE_BUNDLES_SEQUENTIALLY=1 bin/update

Clones or updates the Git repositories specified in `./**/*.get` files:
optionally matching the given BUNDLE_NAME, DIRECTORY, or GET_FILE path,
starting from the most recently modified file down to the earliest one,
checking out the branch or commit named in related `./**/*.set` files.
After that, it runs corresponding `./**/*.run` scripts for those repos.

This is done in parallel, at up to half of the maximum process limit,
unless the `UPDATE_BUNDLES_SEQUENTIALLY` environment variable is set.

### bin/usage

Displays help and usage information for this and fellow scripts.

    Usage: bin/usage [SCRIPT]

### bin/usage-readme

Formats usage information from all scripts for injection into README.

## References

* [Plugin Layout in the Dark Ages][modular] by Steve Losh.

[modular]: http://learnvimscriptthehardway.stevelosh.com/chapters/42.html

* [Configuring Vim right](http://items.sjbach.com/319/configuring-vim-right)
  by Stephen Bach.

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? 👍 Please [spare a life] today as thanks! 🐄🐖🐑🐔🐣🐟✨🙊✌  
> Why? For 💕 ethics, the 🌎 environment, and 💪 health; see link above. 🙇

(the ISC license)

Copyright 2009 Suraj N. Kurapati <https://github.com/sunaku>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
