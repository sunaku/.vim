# A [modular][] (Neo)Vim configuration!

Nearly every (Neo)Vim configuration you find online is composed of a single,
giant `vimrc` file.  But _this one is different_: it's [modular], relying on
(Neo)Vim's behavior of loading all `plugin/**/*.vim` files on startup to
cleanly partition your settings, mappings, bundles, and other configuration
into separate files that each focus on a single topic and _do one thing well_.

## Features

* Modularity of bundles, filetypes, colorschemes, and Vim settings.

* Lazy loading of filetype-specific bundles to start Vim up quickly.

* Parallel installation and updating of bundles from Git repositories.

* Easy upgrades with intelligent and automated Git conflict resolution.

* Shell scripts for bundle management: insert, delete, rename, and more.

## Organization

<!-- vim-markdown-toc GFM -->

  * [Branches](#branches)
  * [Scripts](#scripts)
  * [Bundles](#bundles)
  * [Configs](#configs)
* [Dependencies](#dependencies)
* [Installation](#installation)
* [Usage](#usage)
  * [Bundling](#bundling)
  * [Updating](#updating)
  * [Tracking](#tracking)
  * [Locking](#locking)
* [Manuals](#manuals)
  * [bin/clean](#binclean)
  * [bin/delete](#bindelete)
  * [bin/insert](#bininsert)
  * [bin/orphans](#binorphans)
  * [bin/rebase](#binrebase)
  * [bin/rebase-autocon](#binrebase-autocon)
  * [bin/rebase-stacked](#binrebase-stacked)
  * [bin/rename](#binrename)
  * [bin/rename-editor](#binrename-editor)
  * [bin/rename-fromto](#binrename-fromto)
  * [bin/setup](#binsetup)
  * [bin/update](#binupdate)
  * [bin/usage](#binusage)
  * [bin/usage-readme](#binusage-readme)
* [References](#references)
* [License](#license)

<!-- vim-markdown-toc -->

### Branches

* The **[master]** branch is a "bare bones" template for anyone to start with.

* The **[basics]** branch is a rudimentary configuration of the Standard Vim.

* The **[qwerty]** branch is an enhanced configuration meant for QWERTY typists.

* The **[dvorak]** branch is an optimized configuration meant for Dvorak typists.

* The **[tryout]** branch is the frontier, where I experiment with new plugins.

[master]: https://github.com/sunaku/.vim/tree/master#readme
[basics]: https://github.com/sunaku/.vim/tree/basics#readme
[qwerty]: https://github.com/sunaku/.vim/tree/qwerty#readme
[dvorak]: https://github.com/sunaku/.vim/tree/dvorak#readme
[tryout]: https://github.com/sunaku/.vim/tree/tryout#readme

### Scripts

* `bin/*` scripts automate common tasks.  See below for their usage manuals.

### Bundles

* `**/*.get` files specify URLs of Git repositories to clone for your bundles.

* `**/*.set` files specify branch names or commit SHAs to check out from Git.

* `**/*.run` files specify shell commands to run after updating your bundles.

* `bundle/*/*/` directories are eagerly loaded Vim scripts; see [Unbundle].

* `ftbundle/*/*/` directories are lazily loaded, filetype-specific bundles.

### Configs

* `plugin/**/*.vim` configure Vim _before_ it finishes starting up.

* `bundle/*/*.vim` configure your bundles _before_ they are loaded.

* `ftbundle/*/*.vim` configure your ftbundles _before_ they are loaded.

* `ftplugin/{*,/*}.vim` configure your filetypes _when_ they are loaded.

* `recolor/*.vim` configure your colorschemes _after_ they are applied.

* `after/plugin/**/*.vim` configure Vim _after_ it finishes starting up.

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

    bin/setup         # template
    bin/setup basics  # template + basics
    bin/setup qwerty  # template + basics + my flair
    bin/setup dvorak  # template + basics + my flair + dvorak
    bin/setup tryout  # template + basics + my flair + dvorak + new plugins

## Usage

See usage information:

    bin/usage

See usage information for provided *SCRIPT*:

    bin/usage SCRIPT

### Bundling

Add bundle from *URL* under *CATEGORY*:

    bin/insert URL bundle/CATEGORY

Add bundle from *URL* under *CATEGORY* with *BUNDLE_NAME*:

    bin/insert URL bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from *URL* for *FILETYPE*:

    bin/insert URL ftbundle/FILETYPE

Add ftbundle from *URL* for *FILETYPE* with *BUNDLE_NAME*:

    bin/insert URL ftbundle/FILETYPE/BUNDLE_NAME

Add bundle from Github *USER*/*REPO* under *CATEGORY*:

    bin/insert USER/REPO bundle/CATEGORY

Add bundle from Github *USER*/*REPO* under *CATEGORY* with *BUNDLE_NAME*:

    bin/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from Github *USER*/*REPO* for *FILETYPE*:

    bin/insert USER/REPO ftbundle/FILETYPE

Add ftbundle from Github *USER*/*REPO* for *FILETYPE* with *BUNDLE_NAME*:

    bin/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

Rename bundles with names matching *BUNDLE_NAME* (regexp):

    bin/rename BUNDLE_NAME

Rename all bundles from the comfort of Vim:

    bin/rename-editor BUNDLE_NAME

Rename a `*.get` file from its current name to a new one:

    bin/rename-fromto CURRENT_GET_FILE NEW_GET_FILE

Delete bundles with names matching *BUNDLE_NAME* (regexp):

    bin/delete BUNDLE_NAME

Lists untracked `*.get` files and bundles lacking `*.get` files:

    bin/orphans

Deletes untracked `*.get` files and bundles lacking `*.get` files:

    bin/clean        # asks you for confirmation
    bin/clean -f     # no confirmation; force it

### Updating

Update installed bundles and ftbundles:

    bin/update

Update this Vim configuration framework:

    bin/rebase      # asks to confirm bin/clean
    bin/rebase -f   # no confirmation; force it

Do all that periodically via crontab(1):

    @daily cd ~/.vim && bin/rebase -f && bin/update

### Tracking

Track a certain Git *BRANCH* by creating a `*.set` file for your *BUNDLE*:

    echo BRANCH > BUNDLE.set

Remove *BRANCH* tracking for your *BUNDLE* by deleting its `*.set` file:

    rm BUNDLE.set

### Locking

Lock a *BUNDLE* to a certain Git *COMMITISH* to prevent it from being updated:

    cd BUNDLE
    git checkout COMMITISH

Unlock a locked *BUNDLE*, so it can be updated again, by checking out `master`:

    cd BUNDLE
    git checkout master

## Manuals

The usage manual for each script is reproduced here, for your convenience.

### bin/clean

Deletes untracked `*.get` files and bundles lacking `*.get` files.
If REGEX is provided, it will filter the candidates for deletion.

    Usage: bin/clean [-f] [OPTIONS_FOR_GREP...] [REGEX]
    Usage: bin/clean        # asks you for confirmation
    Usage: bin/clean -f     # no confirmation; force it

### bin/delete

Deletes existing bundles whose names match the given regular expression.

    Usage: bin/delete [OPTIONS_FOR_GREP...] BUNDLE_NAME_REGEXP

### bin/insert

Inserts a new bundle, optionally named BUNDLE_NAME, into the given CATEGORY.
You can specify USER/REPO in place of URL to insert from GitHub repositories.

    Usage: bin/insert [URL|USER/REPO] [ft]bundle/CATEGORY[/BUNDLE_NAME]

    Usage: bin/insert URL bundle/CATEGORY
    Usage: bin/insert URL bundle/CATEGORY/BUNDLE_NAME
    Usage: bin/insert URL ftbundle/FILETYPE
    Usage: bin/insert URL ftbundle/FILETYPE/BUNDLE_NAME

    Usage: bin/insert USER/REPO bundle/CATEGORY
    Usage: bin/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME
    Usage: bin/insert USER/REPO ftbundle/FILETYPE
    Usage: bin/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

### bin/orphans

Lists untracked `*.get` files and bundles lacking `*.get` files.
If a REGEX is provided, it will filter the output of this script.

    Usage: bin/orphans [OPTIONS_FOR_GREP...] [REGEX]

### bin/rebase

Replays local commits atop the newest changes from upstream.

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

Renames existing bundles whose names match the given regular expression.

    Usage: bin/rename [OPTIONS_FOR_GREP...] BUNDLE_NAME_REGEXP

At the prompt, edit the bundle location and press ENTER to rename it so.
If you no longer wish to rename the bundle, just press ENTER to skip it.
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

    Usage: bin/setup         # bare bones
    Usage: bin/setup basics  # bare bones + basic config
    Usage: bin/setup qwerty  # bare bones + basic config + the usual
    Usage: bin/setup dvorak  # bare bones + basic config + the usual + my flair

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

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? :+1:  Please [spare a life] today as thanks!
:cow::pig::chicken::fish::speak_no_evil::v::revolving_hearts:

Copyright 2009 Suraj N. Kurapati <https://github.com/sunaku>

Distributed under the terms of the ISC license (basically MIT).
