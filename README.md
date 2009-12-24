# A modular (Neo)Vim configuration

Unlike most Vim configurations you find online, this one is _modular_: it's
*not* a monolithic `vimrc` file!  May it help you journey the lands of Vim.

## Features

* Modularity of bundles, filetypes, colorschemes, and Vim settings.

* Lazy loading of filetype-specific bundles to start Vim up quickly.

* Parallel installation and updating of bundles from Git repositories.

* Easy upgrades with intelligent and automated Git conflict resolution.

* Shell scripts for bundle management: insert, delete, rename, and more.

## Organization

### Branches

* The **[master]** branch is a bare bones template for anyone to start with.
[master]: https://github.com/sunaku/.vim/tree/master#readme

* The **[earthy]** branch adds my personal configuration of the standard Vim.
[earthy]: https://github.com/sunaku/.vim/tree/earthy#readme

* The **[spacey]** branch adds [an enhanced Space leader][vim-shortcut] key,
  just like [Spacemacs], along with my chosen bundles and their configuration.
[spacey]: https://github.com/sunaku/.vim/tree/spacey#readme
[vim-shortcut]: https://github.com/sunaku/vim-shortcut#readme
[Spacemacs]: http://spacemacs.org/

    ![Screencast](https://github.com/sunaku/vim-shortcut/raw/gh-pages/README.gif)

### Scripts

* The `.do/` directory contains shell scripts that automate various tasks.

### Bundles

* `**/*.get` files specify URLs of Git repositories to clone for your bundles.

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

* [POSIX] environment (Linux, BSD, MacOSX, etc.)
  [POSIX]: http://pubs.opengroup.org/onlinepubs/9699919799/

    Special note to Microsoft Windows users: simply

    * replace `~/.vim` with `%USERPROFILE%\vimfiles`
    * replace `~/.vimrc` with `%USERPROFILE%\_vimrc`

    in all commands listed throughout this document.

* [xargs](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/xargs.1)
  with support for the `-r` command-line option:

    > Do not run the command if there are no arguments.  Normally the
    > command is executed at least once even if there are no arguments.

[Unbundle]: https://github.com/sunaku/vim-unbundle#readme

## Installation

Backup your configuration:

    mv ~/.vim ~/.vim.bak
    mv ~/.config/nvim ~/.config/nvim.bak # for NeoVim

Install this configuration:

    git clone https://github.com/sunaku/.vim.git ~/.vim
    ln -s ~/.vim ~/.config/nvim  # for NeoVim
    cd ~/.vim
    .do/setup

Select a Git branch to use:

    .do/setup           # bare bones
    .do/setup earthy    # bare bones + my config
    .do/setup spacey    # bare bones + my config + my bundles

## Usage

See usage information:

    .do/usage

See usage information for provided *SCRIPT*:

    .do/usage SCRIPT

### Bundling

Add bundle from *URL* under *CATEGORY*:

    .do/insert URL bundle/CATEGORY

Add bundle from *URL* under *CATEGORY* with *BUNDLE_NAME*:

    .do/insert URL bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from *URL* for *FILETYPE*:

    .do/insert URL ftbundle/FILETYPE

Add ftbundle from *URL* for *FILETYPE* with *BUNDLE_NAME*:

    .do/insert URL ftbundle/FILETYPE/BUNDLE_NAME

Add bundle from Github *USER*/*REPO* under *CATEGORY*:

    .do/insert USER/REPO bundle/CATEGORY

Add bundle from Github *USER*/*REPO* under *CATEGORY* with *BUNDLE_NAME*:

    .do/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from Github *USER*/*REPO* for *FILETYPE*:

    .do/insert USER/REPO ftbundle/FILETYPE

Add ftbundle from Github *USER*/*REPO* for *FILETYPE* with *BUNDLE_NAME*:

    .do/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

Rename a single `*.get`a file from its current name to a new one:

    .do/rename CURRENT_GET_FILE_NAME NEW_GET_FILE_NAME

Rename bundles with names matching *BUNDLE_NAME* (regexp):

    .do/rename-prompt BUNDLE_NAME

Rename all bundles from the comfort of Vim:

    .do/rename-editor BUNDLE_NAME

Delete bundles with names matching *BUNDLE_NAME* (regexp):

    .do/delete BUNDLE_NAME

Lists untracked `*.get` files and bundles lacking `*.get` files:

    .do/orphans

Deletes untracked `*.get` files and bundles lacking `*.get` files:

    .do/clean        # asks you for confirmation
    .do/clean -f     # no confirmation; force it

### Updating

Update installed bundles and ftbundles:

    .do/update

Update this Vim configuration framework:

    .do/rebase      # asks to confirm .do/clean
    .do/rebase -f   # no confirmation; force it

Do all that periodically via crontab(1):

    @daily cd ~/.vim && .do/rebase -f && .do/update

#### Locking

Lock a *BUNDLE* to a certain Git *COMMIT* to prevent it from being updated:

    cd BUNDLE
    git checkout COMMIT

Unlock a locked *BUNDLE* so that it can be updated again:

    cd BUNDLE
    git checkout master

### Scripts

Usage information for each script is reproduced here, for your convenience.

#### .do/clean

Deletes untracked `*.get` files and bundles lacking `*.get` files,
as well as any files or directories seen as waste by git-clean(1).

    Usage: .do/clean        # asks you for confirmation
    Usage: .do/clean -f     # no confirmation; force it


#### .do/delete

Deletes existing bundles whose names match the given regular expression.

    Usage: .do/delete [OPTIONS_FOR_GREP...] BUNDLE_NAME_REGEXP


#### .do/insert

Inserts a new bundle, optionally named BUNDLE_NAME, into the given CATEGORY.
You can specify USER/REPO in place of URL to insert from GitHub repositories.

    Usage: .do/insert [URL|USER/REPO] [ft]bundle/CATEGORY[/BUNDLE_NAME]

    Usage: .do/insert URL bundle/CATEGORY
    Usage: .do/insert URL bundle/CATEGORY/BUNDLE_NAME
    Usage: .do/insert URL ftbundle/FILETYPE
    Usage: .do/insert URL ftbundle/FILETYPE/BUNDLE_NAME

    Usage: .do/insert USER/REPO bundle/CATEGORY
    Usage: .do/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME
    Usage: .do/insert USER/REPO ftbundle/FILETYPE
    Usage: .do/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME


#### .do/orphans

Lists untracked `*.get` files and bundles lacking `*.get` files.

    Usage: .do/orphans


#### .do/rebase

Replays local commits atop the newest changes from upstream.

    Usage: .do/rebase      # asks to confirm .do/clean
    Usage: .do/rebase -f   # no confirmation; force it


#### .do/rebase-autocon

    Usage: git-rebase-autocon [TARGET] [ARGUMENTS_FOR_GIT_REBASE...]

Rebases the given TARGET while automatically resolving conflicts
by substituting empty-tree commits labeled "fixup!" that log all
conflicting hunks in their commit messages in git-diff(1) format.

If TARGET is not specified, the upstream tracking branch is used.
Optional ARGUMENTS_FOR_GIT_REBASE... are passed to git-rebase(1).

Documented at <https://sunaku.github.io/git-rebase-autocon.html>

#### .do/rebase-stacked

Rebases the three branches, with spacey atop earthy atop master.


#### .do/rename

Renames the given *.get file and all associated files to the new name.

    Usage: .do/rename CURRENT_GET_FILE_PATHNAME NEW_GET_FILE_PATHNAME


#### .do/rename-editor

Lets you rename all *.get files in one fell swoop, from the comfort of Vim.

    Usage: .do/rename-editor [OPTIONS_FOR_VIM...]

Simply rename the lines you're interested in and then save and quit, but be
careful not to change the order or amount of lines presented in the editor!

To cancel without performing any renames, type "ggdG:wqa" followed by ENTER.


#### .do/rename-editor-urlname

Attempts to rename bundles back to their URL basenames.

    Usage: .do/rename-editor-urlname [OPTIONS_FOR_VIM...]


#### .do/rename-prompt

Renames existing bundles whose names match the given regular expression.

    Usage: .do/rename-prompt [OPTIONS_FOR_GREP...] BUNDLE_NAME_REGEXP

At the prompt, edit the bundle location and press ENTER to rename it so.
If you no longer wish to rename the bundle, just press ENTER to skip it.
If you made a mistake and want to abort the rename, press Control and C.


#### .do/setup

Activates the given BRANCH and installs any bundles it defines.

    Usage: .do/setup [BRANCH]

    Usage: .do/setup master  # bare bones
    Usage: .do/setup config  # bare bones + my config
    Usage: .do/setup bundle  # bare bones + my config + my bundles
    Usage: .do/setup spacey  # bare bones + my config + my bundles + space


#### .do/update

    Usage: .do/update [BUNDLE_NAME|DIRECTORY|GET_FILE]...
    Usage: env UPDATE_BUNDLES_SEQUENTIALLY=1 .do/update

Clones or updates the Git repositories specified in `./**/*.get` files:
optionally matching the given BUNDLE_NAME, DIRECTORY, or GET_FILE path,
starting from the most recently modified file down to the earliest one.
After that, it runs corresponding `./**/*.run` scripts for those repos.

This is done in parallel, at up to half of the maximum process limit,
unless the `UPDATE_BUNDLES_SEQUENTIALLY` environment variable is set.


#### .do/usage

Displays help and usage information for this and fellow scripts.

    Usage: .do/usage [SCRIPT]


#### .do/usage-readme

Formats usage information from all scripts for injection into README.


## References

* http://learnvimscriptthehardway.stevelosh.com/chapters/42.html
