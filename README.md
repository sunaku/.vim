# A modular (Neo)Vim configuration

Unlike most Vim configurations you find online, this one is _modular_: it's
*not* a monolithic `vimrc` file!  May it help you journey the lands of Vim.

Don't forget to check out the handy [list of shortcuts](#shortcuts) below!

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

* `shortcut/**/*.vim` define your shortcuts _after_ bundles are loaded.

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


## Shortcuts

This listing is _also_ available in Vim: just press the **space bar** twice!

Note: Run `stty -ixon` before launching Vim to use `<C-s>` and `<C-q>`.

Note: These shortcuts assume that you type in the [Dvorak keyboard layout](
http://www.dvzine.org/zine/01-toc.html ).  If this assumption does not apply
to you, simply change the following setting inside `plugin/2-keyboard.vim`:

    let g:sunaku_dvorak_keyboard = 0 " turns off Dvorak keyboard shortcuts

Shortcut | Action
---------|-------
<kbd>&lt;Space&gt;</kbd> | Shortcut -&gt; Discover
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;Space&gt;</kbd> | Shortcut -&gt; Discover
<kbd>&lt;Space&gt;</kbd> <kbd>.</kbd> | Shortcut -&gt; Repeat
<kbd>&lt;Space&gt;</kbd> <kbd>`</kbd> <kbd>b</kbd> | Buffer -&gt; Outline
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>b</kbd> | Buffer -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>:</kbd> <kbd>b</kbd> | Buffer -&gt; Each do...
<kbd>&lt;Space&gt;</kbd> <kbd>n</kbd> <kbd>b</kbd> | Buffer -&gt; Focus -&gt; Next
<kbd>&lt;Space&gt;</kbd> <kbd>N</kbd> <kbd>b</kbd> | Buffer -&gt; Focus -&gt; Previous
<kbd>&lt;Space&gt;</kbd> <kbd>O</kbd> <kbd>b</kbd> | Buffer -&gt; Open -&gt; Above
<kbd>&lt;Space&gt;</kbd> <kbd>o</kbd> <kbd>b</kbd> | Buffer -&gt; Open -&gt; Below
<kbd>&lt;Space&gt;</kbd> <kbd>i</kbd> <kbd>b</kbd> | Buffer -&gt; Open -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>a</kbd> <kbd>b</kbd> | Buffer -&gt; Open -&gt; Right
<kbd>&lt;Space&gt;</kbd> <kbd>r</kbd> <kbd>b</kbd> | Buffer -&gt; Reload
<kbd>&lt;Space&gt;</kbd> <kbd>R</kbd> <kbd>b</kbd> | Buffer -&gt; Reload (force)
<kbd>&lt;Space&gt;</kbd> <kbd>w</kbd> <kbd>b</kbd> | Buffer -&gt; Save
<kbd>&lt;Space&gt;</kbd> <kbd>W</kbd> <kbd>b</kbd> | Buffer -&gt; Save (strip)
<kbd>&lt;Space&gt;</kbd> <kbd>y</kbd> <kbd>b</kbd> | Yank -&gt; Buffer
<kbd>&lt;Space&gt;</kbd> <kbd>D</kbd> <kbd>b</kbd> | Buffer -&gt; Close -&gt; All
<kbd>&lt;Space&gt;</kbd> <kbd>d</kbd> <kbd>b</kbd> | Buffer -&gt; Close
<kbd>&lt;Space&gt;</kbd> <kbd>d</kbd> <kbd>$</kbd> | Buffer -&gt; Strip trailing whitespace
<kbd>&lt;C-s&gt;</kbd> | Buffer -&gt; Save (strip)
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>a</kbd> | Comment -&gt; Alternate
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>u</kbd> | Comment -&gt; Uncomment
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>b</kbd> | Comment -&gt; Align -&gt; Both
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>l</kbd> | Comment -&gt; Align -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>A</kbd> | Comment -&gt; Append
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>y</kbd> | Comment -&gt; Yank
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>s</kbd> | Comment -&gt; Sexy
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>i</kbd> | Comment -&gt; Invert
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>$</kbd> | Comment -&gt; To EOL
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>n</kbd> | Comment -&gt; Nested
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>m</kbd> | Comment -&gt; Minimal
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>c</kbd> | Comment -&gt; Toggle
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>c</kbd> | Comment -&gt; Comment
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>P</kbd> | Comment -&gt; Yank -&gt; Paste above
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>p</kbd> | Comment -&gt; Yank -&gt; Paste below
<kbd>&lt;Space&gt;</kbd> <kbd>c</kbd> <kbd>@</kbd> | Comment -&gt; ASCII art (figlet)
<kbd>&lt;Space&gt;</kbd> <kbd>C</kbd> <kbd>t</kbd> | Merge conflict -&gt; Keep their version
<kbd>&lt;Space&gt;</kbd> <kbd>C</kbd> <kbd>o</kbd> | Merge conflict -&gt; Keep our version
<kbd>&lt;Space&gt;</kbd> <kbd>C</kbd> <kbd>b</kbd> | Merge conflict -&gt; Keep both versions
<kbd>&lt;Space&gt;</kbd> <kbd>C</kbd> <kbd>n</kbd> | Merge conflict -&gt; Drop all versions
<kbd>&lt;Space&gt;</kbd> <kbd>/</kbd> <kbd>C</kbd> | Search -&gt; Merge conflicts
<kbd>&lt;Space&gt;</kbd> <kbd>K</kbd> | Search -&gt; API docs (with dasht)
<kbd>&lt;Space&gt;</kbd> <kbd>%</kbd> <kbd>b</kbd> | Diff -&gt; Buffer
<kbd>&lt;Space&gt;</kbd> <kbd>i</kbd> <kbd>%</kbd> | Diff -&gt; Get -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>a</kbd> <kbd>%</kbd> | Diff -&gt; Get -&gt; Right
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>%</kbd> | Diff -&gt; Original
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>%</kbd> | Diff -&gt; Put -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>%</kbd> | Diff -&gt; Put -&gt; Right
<kbd>&lt;Space&gt;</kbd> <kbd>q</kbd> <kbd>%</kbd> | Diff -&gt; Quit
<kbd>&lt;Space&gt;</kbd> <kbd>r</kbd> <kbd>%</kbd> | Diff -&gt; Redraw
<kbd>&lt;Space&gt;</kbd> <kbd>s</kbd> <kbd>f</kbd> | File -&gt; Rename
<kbd>&lt;Space&gt;</kbd> <kbd>d</kbd> <kbd>f</kbd> | File -&gt; Delete
<kbd>&lt;Space&gt;</kbd> <kbd>O</kbd> <kbd>f</kbd> | File -&gt; Open
<kbd>&lt;Space&gt;</kbd> <kbd>o</kbd> <kbd>f</kbd> | File -&gt; Open (relative)
<kbd>&lt;Space&gt;</kbd> <kbd>O</kbd> <kbd>d</kbd> | File -&gt; Browse
<kbd>&lt;Space&gt;</kbd> <kbd>o</kbd> <kbd>d</kbd> | File -&gt; Browse (relative)
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>f</kbd> | File -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>`</kbd> <kbd>f</kbd> | File -&gt; Jump to... (relative)
<kbd>&lt;Space&gt;</kbd> <kbd>y</kbd> <kbd>f</kbd> | File -&gt; Save as...
<kbd>&lt;Space&gt;</kbd> <kbd>Y</kbd> <kbd>f</kbd> | File -&gt; Save as copy
<kbd>&lt;Space&gt;</kbd> <kbd>D</kbd> <kbd>z</kbd> | Fold -&gt; Close -&gt; Others
<kbd>&lt;Space&gt;</kbd> <kbd>z</kbd> <kbd>v</kbd> | Narrow -&gt; Selection
<kbd>&lt;Space&gt;</kbd> <kbd>z</kbd> <kbd>R</kbd> | Narrow -&gt; Off
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>&lt;Tab&gt;</kbd> | Format -&gt; Indent -&gt; Tabs
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>&lt;Space&gt;</kbd> | Format -&gt; Indent -&gt; Spaces
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>1</kbd> | Format -&gt; Markdown -&gt; Title
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>2</kbd> | Format -&gt; Markdown -&gt; Section
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>t</kbd> | Format -&gt; Markdown -&gt; Table header
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>c</kbd> | Format -&gt; Markdown -&gt; Fenced code block
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>=</kbd> | Format -&gt; Separator -&gt; Using equal sign
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>-</kbd> | Format -&gt; Separator -&gt; Using minus sign
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>.</kbd> | Format -&gt; Separator -&gt; Repeat .$ to EOL
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>a</kbd> | Format -&gt; Arguments
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>s</kbd> | Format -&gt; Delimiters
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>)</kbd> | Format -&gt; Delimiters -&gt; Add funcall parens
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>(</kbd> | Format -&gt; Delimiters -&gt; Drop funcall parens
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>&apos;</kbd> | Format -&gt; Quotes -&gt; Double to single
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>&quot;</kbd> | Format -&gt; Quotes -&gt; Single to double
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>:</kbd> | Format -&gt; Ruby -&gt; Quotes to symbol
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>;</kbd> | Format -&gt; Ruby -&gt; Symbol to quotes
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>P</kbd> | Format -&gt; Elixir -&gt; Funcall to pipeline
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>p</kbd> | Format -&gt; Elixir -&gt; Pipeline to funcall
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>J</kbd> | Format -&gt; Elixir -&gt; Join pipeline
<kbd>&lt;Space&gt;</kbd> <kbd>h</kbd> <kbd>j</kbd> | Format -&gt; Elixir -&gt; Split pipeline
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>/</kbd> | Edit -&gt; Search (history)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>?</kbd> | Edit -&gt; File (search)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>:</kbd> | Edit -&gt; Command
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>;</kbd> | Edit -&gt; Command (history)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>B</kbd> | Edit -&gt; Buffer -&gt; Filetype
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>b</kbd> | Edit -&gt; Buffer
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>F</kbd> | Edit -&gt; File (history)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>f</kbd> | Edit -&gt; File
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>g</kbd> | Edit -&gt; Git (status)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>g</kbd> | Edit -&gt; Git
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>h</kbd> | Edit -&gt; Tag (help)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>l</kbd> | Edit -&gt; Lines (buffer)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>L</kbd> | Edit -&gt; Lines (global)
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>m</kbd> | Edit -&gt; Mark
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>]</kbd> | Edit -&gt; Tag
<kbd>&lt;Space&gt;</kbd> <kbd>e</kbd> <kbd>w</kbd> | Edit -&gt; Window
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>g</kbd> | Git -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>/</kbd> <kbd>g</kbd> | Git -&gt; Grep
<kbd>&lt;Space&gt;</kbd> <kbd>s</kbd> <kbd>g</kbd> | Git -&gt; Move file
<kbd>&lt;Space&gt;</kbd> <kbd>S</kbd> <kbd>g</kbd> | Git -&gt; Move file (force)
<kbd>&lt;Space&gt;</kbd> <kbd>L</kbd> <kbd>g</kbd> | Git -&gt; Blame
<kbd>&lt;Space&gt;</kbd> <kbd>a</kbd> <kbd>g</kbd> | Git -&gt; Commit
<kbd>&lt;Space&gt;</kbd> <kbd>A</kbd> <kbd>g</kbd> | Git -&gt; Commit (amend)
<kbd>&lt;Space&gt;</kbd> <kbd>%</kbd> <kbd>g</kbd> | Git -&gt; Diff
<kbd>&lt;Space&gt;</kbd> <kbd>i</kbd> <kbd>g</kbd> | Git -&gt; Edit
<kbd>&lt;Space&gt;</kbd> <kbd>l</kbd> <kbd>g</kbd> | Git -&gt; Log
<kbd>&lt;Space&gt;</kbd> <kbd>r</kbd> <kbd>g</kbd> | Git -&gt; Revert file
<kbd>&lt;Space&gt;</kbd> <kbd>R</kbd> <kbd>g</kbd> | Git -&gt; Revert file (force)
<kbd>&lt;Space&gt;</kbd> <kbd>`</kbd> <kbd>g</kbd> | Git -&gt; Status
<kbd>&lt;Space&gt;</kbd> <kbd>w</kbd> <kbd>g</kbd> | Git -&gt; Stage hunk
<kbd>&lt;Space&gt;</kbd> <kbd>u</kbd> <kbd>g</kbd> | Git -&gt; Revert hunk
<kbd>&lt;Space&gt;</kbd> <kbd>%</kbd> <kbd>g</kbd> | Git -&gt; Preview hunk
<kbd>&lt;Space&gt;</kbd> <kbd>W</kbd> <kbd>g</kbd> | Git -&gt; Stage file
<kbd>&lt;Space&gt;</kbd> <kbd>d</kbd> <kbd>g</kbd> | Git -&gt; Delete file
<kbd>&lt;Space&gt;</kbd> <kbd>D</kbd> <kbd>g</kbd> | Git -&gt; Delete file (force)
<kbd>&lt;Space&gt;</kbd> <kbd>g</kbd> <kbd>h</kbd> | Git -&gt; Hunk -&gt; Signs
<kbd>&lt;Space&gt;</kbd> <kbd>g</kbd> <kbd>H</kbd> | Git -&gt; Hunk -&gt; Highlights
<kbd>&lt;Space&gt;</kbd> <kbd>g</kbd> <kbd>g</kbd> | Git -&gt; Magit workflow
<kbd>&lt;C-q&gt;</kbd> | Vim -&gt; Quit
<kbd>&lt;Space&gt;</kbd> <kbd>q</kbd> <kbd>v</kbd> | Vim -&gt; Quit
<kbd>&lt;Space&gt;</kbd> <kbd>Q</kbd> <kbd>v</kbd> | Vim -&gt; Quit (Force)
<kbd>&lt;Space&gt;</kbd> <kbd>/</kbd> | Search -&gt; Fuzzy
<kbd>&lt;Space&gt;</kbd> <kbd>?</kbd> | Search -&gt; Codebase
<kbd>&lt;Space&gt;</kbd> <kbd>&amp;</kbd> | Search -&gt; Replace (interactive)
<kbd>&lt;Space&gt;</kbd> <kbd>*</kbd> | Search -&gt; Replace (interactive) -&gt; Word under cursor
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;C-A&gt;</kbd> | Number -&gt; Sequence -&gt; Increment
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;C-X&gt;</kbd> | Number -&gt; Sequence -&gt; Decrement
<kbd>&lt;Space&gt;</kbd> <kbd>d</kbd> <kbd>t</kbd> | Tab -&gt; Close
<kbd>&lt;Space&gt;</kbd> <kbd>D</kbd> <kbd>t</kbd> | Tab -&gt; Close -&gt; Others
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>t</kbd> | Tab -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>n</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; Next
<kbd>&lt;Space&gt;</kbd> <kbd>N</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; Previous
<kbd>&lt;Space&gt;</kbd> <kbd>1</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 1
<kbd>&lt;Space&gt;</kbd> <kbd>2</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 2
<kbd>&lt;Space&gt;</kbd> <kbd>3</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 3
<kbd>&lt;Space&gt;</kbd> <kbd>4</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 4
<kbd>&lt;Space&gt;</kbd> <kbd>5</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 5
<kbd>&lt;Space&gt;</kbd> <kbd>6</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 6
<kbd>&lt;Space&gt;</kbd> <kbd>7</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 7
<kbd>&lt;Space&gt;</kbd> <kbd>8</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 8
<kbd>&lt;Space&gt;</kbd> <kbd>9</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; 9
<kbd>&lt;Space&gt;</kbd> <kbd>:</kbd> <kbd>t</kbd> | Tab -&gt; Each do...
<kbd>&lt;Space&gt;</kbd> <kbd>^</kbd> <kbd>t</kbd> | Tab -&gt; Move -&gt; First
<kbd>&lt;Space&gt;</kbd> <kbd>$</kbd> <kbd>t</kbd> | Tab -&gt; Move -&gt; Last
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>t</kbd> | Tab -&gt; Move -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>t</kbd> | Tab -&gt; Move -&gt; Right
<kbd>&lt;Space&gt;</kbd> <kbd>I</kbd> <kbd>t</kbd> | Tab -&gt; Open -&gt; First
<kbd>&lt;Space&gt;</kbd> <kbd>A</kbd> <kbd>t</kbd> | Tab -&gt; Open -&gt; Last
<kbd>&lt;Space&gt;</kbd> <kbd>i</kbd> <kbd>t</kbd> | Tab -&gt; Open -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>a</kbd> <kbd>t</kbd> | Tab -&gt; Open -&gt; Right
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>.</kbd> <kbd>i</kbd> <kbd>.</kbd> <kbd>&apos;</kbd> <kbd>t</kbd> | Tab -&gt; Focus -&gt; &apos;. i, &apos;tabfirst&apos;, i .&apos;tabnext
<kbd>&lt;Space&gt;</kbd> <kbd>!</kbd> <kbd>n</kbd> | Test -&gt; Nearest
<kbd>&lt;Space&gt;</kbd> <kbd>!</kbd> <kbd>f</kbd> | Test -&gt; File
<kbd>&lt;Space&gt;</kbd> <kbd>!</kbd> <kbd>F</kbd> | Test -&gt; Suite
<kbd>&lt;Space&gt;</kbd> <kbd>!</kbd> <kbd>!</kbd> | Test -&gt; Last
<kbd>&lt;Space&gt;</kbd> <kbd>!</kbd> <kbd>v</kbd> | Test -&gt; Visit
<kbd>&lt;Space&gt;</kbd> <kbd>o</kbd> <kbd>x</kbd> | Tmux -&gt; Set target pane
<kbd>&lt;Space&gt;</kbd> <kbd>W</kbd> <kbd>x</kbd> | Tmux -&gt; Send buffer
<kbd>&lt;Space&gt;</kbd> <kbd>w</kbd> <kbd>x</kbd> | Tmux -&gt; Send line or selection
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>#</kbd> | Toggle -&gt; Highlight -&gt; Hex colors
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>@</kbd> | Toggle -&gt; Highlight -&gt; ANSI escapes
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>&lt;Bar&gt;</kbd> | Toggle -&gt; Table editing mode
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>*</kbd> | Toggle -&gt; Highlight -&gt; Cursor word
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>S</kbd> | Toggle -&gt; Highlight -&gt; Semantic words
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>v</kbd> | Toggle -&gt; Distractions-free writing
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>V</kbd> | Toggle -&gt; Highlight -&gt; Limelight
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>&lt;Tab&gt;</kbd> | Toggle -&gt; Automatic completion
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>]</kbd> | Toggle -&gt; Tag list
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>^</kbd> | Toggle -&gt; Highlight -&gt; Indentation
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>N</kbd> | Toggle -&gt; Line numbering (relative)
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>n</kbd> | Toggle -&gt; Line numbering
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>p</kbd> | Toggle -&gt; Paste verbatim
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>Q</kbd> | Toggle -&gt; Automatic formatting
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>q</kbd> | Toggle -&gt; Quickfix list
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>l</kbd> | Toggle -&gt; Location list
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>s</kbd> | Toggle -&gt; Spelling check
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>w</kbd> | Format -&gt; Pencil -&gt; Toggle
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>z</kbd> | Toggle -&gt; Code folding
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>d</kbd> | Toggle -&gt; Todo list
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>D</kbd> | Toggle -&gt; Todo list archive
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>r</kbd> | Toggle -&gt; Register list
<kbd>&lt;Space&gt;</kbd> <kbd>t</kbd> <kbd>t</kbd> | Toggle -&gt; Highlight -&gt; f/F/t/T targets
<kbd>&lt;Space&gt;</kbd> <kbd>uu</kbd> | Undo -&gt; Tree
<kbd>&lt;Space&gt;</kbd> <kbd>u.</kbd> | Undo -&gt; Replay
<kbd>&lt;Space&gt;</kbd> <kbd>:</kbd> <kbd>u</kbd> | Unite command line
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>m</kbd> | Mark -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>:</kbd> | Command -&gt; Find and run
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>!</kbd> | Program -&gt; Find and run
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>s</kbd> | Spelling -&gt; Find correction
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>r</kbd> | Register -&gt; Find and paste
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>]</kbd> | Tag -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>*</kbd> | Line -&gt; Jump to word under cursor...
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>l</kbd> | Line -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>v</kbd> <kbd>b</kbd> | Visual -&gt; Buffer
<kbd>&lt;Space&gt;</kbd> <kbd>&apos;</kbd> <kbd>w</kbd> | Window -&gt; Jump to...
<kbd>&lt;Space&gt;</kbd> <kbd>:</kbd> <kbd>w</kbd> | Window -&gt; Each do...
<kbd>&lt;Space&gt;</kbd> <kbd>y</kbd> <kbd>w</kbd> | Window -&gt; Yank
<kbd>&lt;Space&gt;</kbd> <kbd>p</kbd> <kbd>w</kbd> | Window -&gt; Paste
<kbd>&lt;Space&gt;</kbd> <kbd>n</kbd> <kbd>w</kbd> | Window -&gt; Focus -&gt; Next
<kbd>&lt;Space&gt;</kbd> <kbd>N</kbd> <kbd>w</kbd> | Window -&gt; Focus -&gt; Previous
<kbd>&lt;Space&gt;</kbd> <kbd>O</kbd> <kbd>w</kbd> | Window -&gt; Split -&gt; Above
<kbd>&lt;Space&gt;</kbd> <kbd>o</kbd> <kbd>w</kbd> | Window -&gt; Split -&gt; Below
<kbd>&lt;Space&gt;</kbd> <kbd>i</kbd> <kbd>w</kbd> | Window -&gt; Split -&gt; Left
<kbd>&lt;Space&gt;</kbd> <kbd>a</kbd> <kbd>w</kbd> | Window -&gt; Split -&gt; Right
<kbd>&lt;Space&gt;</kbd> <kbd>d</kbd> <kbd>w</kbd> | Window -&gt; Close
<kbd>&lt;Space&gt;</kbd> <kbd>D</kbd> <kbd>w</kbd> | Window -&gt; Close -&gt; Others
<kbd>&lt;Space&gt;</kbd> <kbd>=</kbd> <kbd>w</kbd> | Window -&gt; Size -&gt; Equal
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>S</kbd> | Window -&gt; Size -&gt; Minimum
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>H</kbd> | Window -&gt; Size -&gt; Minimum -&gt; Height
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>W</kbd> | Window -&gt; Size -&gt; Minimum -&gt; Width
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>s</kbd> | Window -&gt; Size -&gt; Less
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>h</kbd> | Window -&gt; Size -&gt; Less -&gt; Height
<kbd>&lt;Space&gt;</kbd> <kbd>&lt;</kbd> <kbd>w</kbd> | Window -&gt; Size -&gt; Less -&gt; Width
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>s</kbd> | Window -&gt; Size -&gt; More
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>h</kbd> | Window -&gt; Size -&gt; More -&gt; Height
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>w</kbd> | Window -&gt; Size -&gt; More -&gt; Width
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>S</kbd> | Window -&gt; Size -&gt; Maximum
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>H</kbd> | Window -&gt; Size -&gt; Maximum -&gt; Height
<kbd>&lt;Space&gt;</kbd> <kbd>&gt;</kbd> <kbd>W</kbd> | Window -&gt; Size -&gt; Maximum -&gt; Width
<kbd>&lt;Leader&gt;</kbd> <kbd>0</kbd> | Window -&gt; Size -&gt; Equal
<kbd>&lt;Leader&gt;</kbd> <kbd>1</kbd> | Window -&gt; Size -&gt; Maximum

### Leader

* `,` is the `<Leader>` prefix for _some_ shortcuts in this configuration.

### Space

* `<Space>` (space bar) precedes _most_ shortcuts in this configuration.
  Press it and wait for 2 seconds for searchable menu of all shortcuts.
* `<Space><Space>` immediately opens a searchable menu of all shortcuts.
* `<Space>.` repeats the most recent `<Space>` shortcut you have issued.

### Command

* `;` puts Vim into command mode. It is a shift-less alternative to `:`.
* `!` puts Vim into command mode, ready to run an external shell command.

### Buffer

* `<C-s>` saves the current buffer after stripping trailing whitespace.

### Quit

* `<C-q>` quits Vim (after confirmation if you have any unsaved buffers).

### Window

Focus:

* (Dvorak) `<A-d>` focuses previously focused tmux pane.
* (Dvorak) `<A-h>` focuses window at left.
* (Dvorak) `<A-t>` focuses window above.
* (Dvorak) `<A-n>` focuses window below.
* (Dvorak) `<A-s>` focuses window at right.

* (QWERTY) `<A-h>` focuses window at left.
* (QWERTY) `<A-j>` focuses window above.
* (QWERTY) `<A-k>` focuses window below.
* (QWERTY) `<A-l>` focuses window at right.
* (QWERTY) `<A-;>` focuses previously focused tmux pane.

Scroll:

* `<C-Left>` scrolls window left.
* `<C-Right>` scrolls window right.
* `<C-S-Left>` scrolls window all the way left.
* `<C-S-Right>` scrolls window all the way right.

### Fold

Jump:

* `<C-Up>` jumps to nearest fold above current line.
* `<C-Down>` jumps to nearest fold below current line.
* `<C-S-Up>` jumps to nearest section above current line.
* `<C-S-Down>` jumps to nearest section below current line.

Fold:

* `<A-Down>` opens current fold.
* `<A-S-Down>` opens current fold and any folds contained therein.
* `<A-Up>` closes current fold.
* `<A-S-Up>` closes current fold and any folds contained therein.

Level:

* `<A-Left>` closes folds at current level.
* `<A-S-Left>` closes all folds.
* `<A-Right>` opens folds at next level.
* `<A-S-Right>` opens all folds.

From [origami](https://github.com/kshenoy/vim-origami#readme):

* `<count>Za`  Align all folds of level 'count'
*        `ZA`  Align all folds
* `<count>ZF`  Insert a start foldmarker of level 'count' at the end of line and comment it
* `<count>Zf`  Insert a start foldmarker of level 'count' at the end of line but don't comment it
* `<count>ZC`  Insert an end  foldmarker of level 'count' at the end of line and comment it
* `<count>Zc`  Insert an end  foldmarker of level 'count' at the end of line but don't comment it
*        `ZD`  Delete the foldmarker from the line

### Text object

* `<Space>` is for [whitespace](https://github.com/vim-utils/vim-space).
* `=` is for [merge conflict](https://github.com/rhysd/vim-textobj-conflict).
* `c` and `C` are for [vertical columns](https://github.com/coderifous/textobj-word-column.vim).
* `h` is for [Git hunks](https://github.com/airblade/vim-gitgutter#readme).
* `i` is for [indentation](https://github.com/thinca/vim-textobj-between).
* `l` is for [the current line](https://github.com/kana/vim-textobj-line).
* `o` and `O` are for [code comments](https://github.com/glts/vim-textobj-comment).
* `q` is for [quoted text](https://github.com/beloglazov/vim-textobj-quotes).
* `r` is for block structures in VimL and Ruby.
* `u` is for [URLs](https://github.com/mattn/vim-textobj-url).
* `v` is for [variable names](https://github.com/robmiller/vim-movar).
* `y` is for [syntax elements](https://github.com/kana/vim-textobj-syntax).

### Operator

* `Q` formats the current paragraph or text selection using `gq`.
* `R` is for [replace](https://github.com/romgrk/replace.vim#readme).
* `s` is for [sandwich](https://github.com/machakann/vim-sandwich#readme).
* `g@` decorates motion or visual selection using [FIGlet](http://www.figlet.org).
* `g<`, `g>`, and `gs` are for [swap](https://github.com/machakann/vim-swap#how-to-use).

### Insert

From [blockinsert](https://github.com/kurkale6ka/vim-blockinsert#readme):

* `<Leader>i` inserts at *soft* beginning of line in paragraph or visual selection.
* `<Leader>a` inserts at *soft* end of line in current paragraph or visual selection.

### Search

* `<C-L>` clears search result highlighting.
* `-` repeats the current `f`,`F`,`t`,`T` forward like the original `;` does.
* `_` repeats the current `f`,`F`,`t`,`T` backward like the original `,` does.

### Inspect

From [gazetteer](https://github.com/jeetsukumaran/vim-gazetteer#readme):

* `gG` shows function, method, class of the current cursor position.

From [SyntaxAttr](https://github.com/vim-scripts/SyntaxAttr.vim#readme):

* `gA` shows syntax highlighting group of the current cursor position.

From [characterize](https://github.com/tpope/vim-characterize#readme):

* `ga` shows ASCII and Unicode information for character under cursor.

### Motion

From [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion#readme):

* `,w` is like `w` but aware of camel and snake case; it's also a text object.
* `,b` is like `b` but aware of camel and snake case; it's also a text object.
* `,e` is like `e` but aware of camel and snake case; it's also a text object.

From [indentwise](https://github.com/jeetsukumaran/vim-indentwise#readme):

* `[-` moves to *previous* line of *lesser* indent than the current line.
* `[+` moves to *previous* line of *greater* indent than the current line.
* `[=` moves to *previous* line of *same* indent as the current line that is separated from the current line by lines of different indents.
* `]-` moves to *next* line of *lesser* indent than the current line.
* `]+` moves to *next* line of *greater* indent than the current line.
* `]=` moves to *next* line of *same* indent as the current line that is separated from the current line by lines of different indents.
* `{count}[_` moves to *previous* line with indent-level of `{count}`.
* `{count}]_` moves to *next* line with indent-level of `{count}`.
* `[%` moves to beginning of indent-block scope (i.e., move to the line just after the previous line of lesser indent); repeat for `{count}` outer scopes.
* `]%` moves to end of indent-block scope (i.e., move to the line just before the next line of lesser indent); repeat for `{count}` outer scopes.

### Select

* `gV` selects last edited or pasted region.

### Yank

* `Y` yanks from cursor to end of line, like Vim's `C` and `D` shortcuts.
* `<Leader>y` copies the current visual selection to the system clipboard.

### Toggle

[Unimpaired.vim](https://github.com/tpope/vim-unimpaired#readme):

* `coc` toggles highlighting the current line.
* `coh` toggles highlighting search results.
* `col` toggles displaying non-printable characters.
* `con` toggles line numbering.
* `cor` toggles relative line numbering.
* `cos` toggles spell check.
* `cou` toggles highlighting the current column.

### Auto-completion

See [NeoComplete.vim](https://github.com/Shougo/neocomplete.vim#readme)
and [NeoSnippet.vim](https://github.com/Shougo/neosnippet.vim#readme).

In insert mode, when the auto-completion pop-up menu appears:

* `<Return>` accepts chosen completion and starts new line.
* `<Tab>` cycles through completion menu or snippet anchors.
* `<C-j>` expands snippet for chosen completion.
* `<C-e>` accepts common prefix of completion choices.
* `<C-u>` forgets chosen completion so you can choose again.
* `<C-g>` cancels completion.

### Git integration

See [Magit](https://github.com/jreybert/vimagit#readme)
and [Fugitive.vim](https://github.com/tpope/fugitive#readme)
and [Extradite.vim](https://github.com/int3/vim-extradite#readme)
and [GitGutter.vim](https://github.com/airblade/vim-gitgutter#readme).

## URxvt integration

If you use Vim in the URxvt terminal emulator, then load the following
snippet into xrdb(1) so you can use all the shortcuts defined in this
Vim configuration:

    xrdb -merge ~/.vim/urxvt.xrdb

## References

* http://learnvimscriptthehardway.stevelosh.com/chapters/42.html
* http://vim.wikia.com/wiki/Example_vimrc
* http://items.sjbach.com/319/configuring-vim-right
* http://push.cx/2008/256-color-xterms-in-ubuntu
* http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
* http://vim.wikia.com/wiki/Single_tags_file_for_a_source_tree
* http://vimcasts.org/episodes/bubbling-text/
* http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
* http://www.reddit.com/r/vim/comments/1giij9/list_you_favorite_plugins/calvpr9
* https://sunaku.github.io/switching-from-jedit-to-vim.html
* https://sunaku.github.io/vim-script-management-system.html
