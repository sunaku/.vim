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
* [Shortcuts](#shortcuts)
  * [Mnemonics](#mnemonics)
  * [Cheatsheet](#cheatsheet)
  * [Control](#control)
  * [Command](#command)
  * [Motion](#motion)
  * [Selection](#selection)
  * [Clipboard](#clipboard)
  * [Completion](#completion)
  * [Window](#window)
  * [Folding](#folding)
  * [URxvt integration](#urxvt-integration)
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

## Shortcuts

This branch of the Vim configuration defines the following shortcuts.

* `,` is the `<Leader>`, used in _some_ shortcuts in this configuration.

* `<Space>` (space bar) precedes _most_ shortcuts in this configuration.
  Press it and wait a moment to view a searchable menu of all shortcuts.
  To use it in a `:normal` command, type `<C-V>` twice and then `<Space>`:

  ```vim
  :normal ^V ic
  ```

* `<Space><Space>` immediately opens a searchable menu of all shortcuts.

### Mnemonics

Inspired by the "verb then subject" design of Vim's own normal mode shortcuts,
I have attempted to mirror its mnemonic devices in my own `<Space>` shortcuts:

| Shortcuts  | Key      | Mnemonic        | Same as Vim? |
| ---------- | -------- | --------------- | ------------ |
| `<Space>a` | a        | **a**ppend      | Yes          |
| `<Space>o` | o        | **o**pen        | Yes          |
| `<Space>e` | e        | **e**xpose      | No           |
| `<Space>u` | u        | **u**ndo        | Yes          |
| `<Space>i` | i        | **i**nsert      | Yes          |
| `<Space>d` | d        | **d**elete      | Yes          |
| `<Space>h` | h        | diff (**h**unk) | No           |
| `<Space>t` | t        | **t**oggle      | No           |
| `<Space>n` | n        | **n**ext        | Yes          |
| `<Space>w` | w        | **w**rite       | No           |
| `<Space>v` | v        | **v**isual      | Yes          |
| `<Space>z` | z        | fold            | Yes          |
| `<Space>,` | ,        | execute         | No           |
| `<Space>.` | .        | repeat          | Yes          |
| `<Space>p` | p        | **p**aste       | Yes          |
| `<Space>y` | y        | **y**ank        | Yes          |
| `<Space>f` | f        | **f**ormat      | No           |
| `<Space>c` | c        | **c**hange      | Yes          |
| `<Space>r` | r        | **r**ead        | No           |

### Cheatsheet

This table is *always* available (and searchable) in Vim: press **space bar** twice!

Shortcut              | Description
--------              | -----------
``-``                 | (sneak) repeat last sneak forward
``0gt``               | expose last tab
``1gt``               | expose first tab
``2gt``               | expose tab 2
``3gt``               | expose tab 3
``4gt``               | expose tab 4
``5gt``               | expose tab 5
``6gt``               | expose tab 6
``7gt``               | expose tab 7
``8gt``               | expose tab 8
``9gt``               | expose tab 9
``<C-Q>``             | exit/quit vim
``<C-S>``             | strip trailing whitespace in buffer and write buffer to file
``<Leader><C-Q>``     | exit/quit vim forcefully
``<Leader><Leader>k`` | (dasht) search ALL the docsets at command prompt
``<Leader><Leader>K`` | (dasht) search ALL the docsets for cursor word or selected text
``<Leader><S-Down>``  | minimum window height
``<Leader><S-Left>``  | minimum window width
``<Leader><S-Right>`` | maximum window width
``<Leader><S-Up>``    | maximum window height
``<Leader>[[``        | (blockinsert) blockwise surround at start and end of line
``<Leader>[]``        | (blockinsert) blockwise insert at start then end of line
``<Leader>]]``        | (blockinsert) blockwise surround at start and end of line
``<Leader>a``         | (blockinsert) blockwise append at end of line
``<Leader>b``         | (CamelCaseMotion) go to start of current word in camel/snake case
``<Leader>e``         | (CamelCaseMotion) go to end of current word in camel/snake case
``<Leader>g@``        | (FIGlet) comment {motion} or visual selection as ASCII art
``<Leader>ge``        | (CamelCaseMotion) go to end of previous word in camel/snake case
``<Leader>i``         | (blockinsert) blockwise insert at start of line
``<Leader>k``         | (dasht) search related docsets at command prompt
``<Leader>K``         | (dasht) search related docsets for cursor word or selected text
``<Leader>p``         | paste after cursor, adding a space
``<Leader>P``         | paste before cursor, adding a space
``<Leader>q[[``       | (blockinsert) blockwise execute at start and end of line
``<Leader>q[]``       | (blockinsert) blockwise execute at start then end of line
``<Leader>q]]``       | (blockinsert) blockwise execute at start and end of line
``<Leader>qa``        | (blockinsert) blockwise execute at end of line
``<Leader>qi``        | (blockinsert) blockwise execute at start of line
``<Leader>w``         | (CamelCaseMotion) go to start of next word in camel/snake case
``<p``                | (unimpaired) Paste after cursor, linewise, decreasing indent.
``<P``                | (unimpaired) Paste before cursor, linewise, decreasing indent.
``<S-Down>``          | decrease window height
``<S-Left>``          | decrease window width
``<S-Right>``         | increase window width
``<S-Up>``            | increase window height
``<Space>$t``         | move tab to last place
``<Space>+w``         | increase window size
``<Space>,.t``        | (test) repeat recent test run
``<Space>,;``         | (fzf) run command from menu
``<Space>,c``         | (fzf) apply colorscheme
``<Space>,f``         | (fzf) apply filetype
``<Space>,s``         | (unite) apply spelling correction
``<Space>,T``         | (table-mode) evaluate "tmf:" formula line
``<Space>,tb``        | (test) run all tests in buffer
``<Space>,tn``        | (test) run test under cursor
``<Space>,ts``        | (test) run all tests in suite
``<Space>-w``         | decrease window size
``<Space>./``         | (fzf) repeat search from history
``<Space>.;``         | (fzf) repeat command from history
``<Space>.f``         | (fzf) open file from history
``<Space>//``         | fuzzy-regex search in buffer
``<Space>/d``         | (ferret) search directory
``<Space>/g``         | (fugitive) git grep: search repository
``<Space>0c``         | (NERDCommenter) comment, minimally
``<Space>0T``         | (table-mode) sort current column at cursor
``<Space>0w``         | minimum window size
``<Space>1c``         | (NERDCommenter) comment, sexily
``<Space>1T``         | (table-mode) add fomula for current table cell
``<Space>1w``         | maximum window size
``<Space>2c``         | (NERDCommenter) comment, nesting
``<Space><Space>``    | show shortcut menu and run chosen shortcut
``<Space><t``         | move tab left
``<Space>=c``         | (NERDCommenter) comment, aligning both delimiters
``<Space>=T``         | (table-mode) realign table columns
``<Space>=w``         | equal window sizes
``<Space>>t``         | move tab right
``<Space>^t``         | move tab to first place
``<Space>``           | fallback to shortcut menu on partial entry
``<Space>ac``         | (NERDCommenter) append comment at end of line
``<Space>Ag``         | (fugitive) git commit --amend
``<Space>ag``         | (fugitive) git commit: record new commit
``<Space>at``         | append new tab
``<Space>At``         | append new tab in last place
``<Space>aw``         | split window right
``<Space>c*``         | (traces) interactive search and replace for word at cursor
``<Space>c/``         | (traces) interactive search and replace in selection or buffer
``<Space>cf``         | (eunuch) rename file
``<Space>cF``         | (Xtract) extract selection into relative file
``<Space>Cg``         | (fugitive) git mv -f: rename file forcefully
``<Space>cg``         | (fugitive) git mv: rename file
``<Space>Cq``         | (ferret) search and replace in quickfix list
``<Space>cq``         | (qfreplace) interactively change lines in quickfix window
``<Space>d$``         | strip trailing whitespace in buffer
``<Space>db``         | (sayonara) close buffer while retaining window
``<Space>DB``         | (wipeout) destroy all buffers not open in any tabs or windows
``<Space>Db``         | close all buffers
``<Space>dc``         | (NERDCommenter) uncomment, deleting comment delimiters
``<Space>de``         | (errormarker) remove all error markers from signcolumn
``<Space>df``         | (eunuch) prompt to delete file
``<Space>Dg``         | (fugitive) git rm -f: delete file from repository forcefully
``<Space>dg``         | (fugitive) git rm: delete file from repository
``<Space>DT``         | (table-mode) delete current column or [count] right columns
``<Space>dT``         | (table-mode) delete current row or [count] rows
``<Space>Dt``         | close other tabs
``<Space>dt``         | close tab
``<Space>Dw``         | close other windows
``<Space>dw``         | close window
``<Space>Dz``         | close all other folds in buffer
``<Space>e*``         | (unite) expose line in buffer matching word at cursor
``<Space>e.t``        | (test) expose recently ran test
``<Space>e<Space>``   | (fzf) trigger mapping / keybinding / shortcut
``<Space>ea``         | (fzf) expose tag in any buffer
``<Space>eA``         | (fzf) expose tag in buffer
``<Space>Ea``         | show tag name at cursor
``<Space>ee``         | (errormarker) expose error message for cursor position
``<Space>Eg``         | (extradite) browse git log for buffer
``<Space>EG``         | (fugitive) git blame: who changed which line
``<Space>eg``         | (fzf) browse git log
``<Space>eG``         | (fzf) browse git log for buffer
``<Space>ej``         | (unite) expose jump in buffer
``<Space>eL``         | (fzf) expose line in any buffer
``<Space>el``         | (fzf) expose line in buffer
``<Space>em``         | (fzf) expose mark in buffer
``<Space>eo``         | (unite) expose section in buffer outline
``<Space>eq``         | (unite) expose line in quickfix window
``<Space>ew``         | (fzf) expose window in any tab
``<Space>ex``         | (scratch) expose scratch buffer
``<Space>f"``         | convert single to double quotes at cursor
``<Space>f'``         | convert double to single quotes at cursor
``<Space>f(``         | format function call, removing parentheses
``<Space>f)``         | format function call, adding parentheses
``<Space>f-``         | format as separator, appending minus signs to end of line
``<Space>f1``         | format as markdown title heading ``<h1>``
``<Space>f2``         | format as markdown section heading ``<h2>``
``<Space>f:``         | format ruby quotes to symbol at cursor
``<Space>f;``         | format ruby symbol to quotes at cursor
``<Space>f<Space>``   | indent with spaces in buffer
``<Space>f<Tab>``     | indent with tabs in buffer
``<Space>f=``         | format as separator, appending equal signs to end of line
``<Space>f_``         | format as separator, repeating last character to end of line
``<Space>fa``         | (argwrap) toggle multi-line syntax at cursor
``<Space>fc``         | format as markdown fenced code block
``<Space>fJ``         | format elixir pipeline at cursor: join into a single line
``<Space>fK``         | format elixir pipeline at cursor: split into multiple lines
``<Space>fP``         | format elixir function call to pipeline at cursor
``<Space>fp``         | format elixir pipeline to function call at cursor
``<Space>fs``         | (switch) cycle through alternate syntax at cursor
``<Space>fT``         | (table-mode) tabelize selection, using \| as delimiter
``<Space>FT``         | (table-mode) tableize selection, asking for delimiter
``<Space>ft``         | format as markdown table heading ``<th>``
``<Space>gT``         | (table-mode) inspect table, for defining formulas
``<Space>h,``         | diff obtain hunk from left window
``<Space>h.``         | diff obtain hunk from right window
``<Space>h<``         | diff put hunk into left window
``<Space>h>``         | diff put hunk into right window
``<Space>hb``         | diff buffer against original version
``<Space>hc``         | (conflict-marker) resolve merge conflict by keeping both versions
``<Space>hg``         | (fugitive) git diff: show changes against repository
``<Space>Hg``         | (GitGutter) preview git hunk at cursor
``<Space>hn``         | (conflict-marker) resolve merge conflict by deleting both versions
``<Space>ho``         | (conflict-marker) resolve merge conflict by keeping our version
``<Space>ht``         | (conflict-marker) resolve merge conflict by keeping their version
``<Space>iC``         | (NERDCommenter) comment from cursor to end of line
``<Space>Ic``         | (NERDCommenter) comment, aligning left delimiter
``<Space>ic``         | (NERDCommenter) comment, inserting comment delimiters
``<Space>ig``         | (GitGutter) stage git hunk at cursor
``<Space>it``         | insert new tab
``<Space>It``         | insert new tab in first place
``<Space>iw``         | split window left
``<Space>Ix``         | (scratch) clear scratch buffer and enter insert mode in it
``<Space>ix``         | (scratch) enter insert mode in scratch buffer
``<Space>nt``         | expose next tab
``<Space>Nt``         | expose previous tab
``<Space>ob``         | (fzf) open buffer
``<Space>oD``         | (VimFiler) browse buffer directory
``<Space>od``         | (VimFiler) browse working directory
``<Space>oF``         | (fzf) open file in buffer directory
``<Space>of``         | (fzf) open file under working directory
``<Space>OF``         | (unite) open file in buffer directory
``<Space>Of``         | (unite) open file under working directory
``<Space>OG``         | (fugitive) open git status window
``<Space>Og``         | (fugitive) return to editing git buffer
``<Space>og``         | (fzf) open file in git repository
``<Space>oG``         | (fzf) open file in git status
``<Space>oh``         | (fzf) open help topic
``<Space>oH``         | search for helptags and display Vim version information
``<Space>oL``         | (fzf) open line in any file in directory
``<Space>Ow``         | split window above
``<Space>ow``         | split window below
``<Space>ox``         | (slimux) select target pane interactively
``<Space>Pc``         | (NERDCommenter) duplicate above cursor and comment
``<Space>pc``         | (NERDCommenter) duplicate below cursor and comment
``<Space>pp``         | paste after cursor, adding an extra newline
``<Space>pP``         | paste after cursor, surrounding with newlines
``<Space>PP``         | paste before cursor, adding an extra newline
``<Space>Pp``         | paste before cursor, surrounding with newlines
``<Space>pr``         | (unite) paste register
``<Space>pw``         | paste window
``<Space>rb``         | reload buffer from file
``<Space>Rb``         | reload buffer from file forcefully
``<Space>Rg``         | (fugitive) git checkout -f: revert buffer to repository forcefully
``<Space>rg``         | (fugitive) git checkout: revert buffer to repository
``<Space>t!``         | toggle interactive coding environment
``<Space>t#``         | (colorizer) toggle hex color code highlighting
``<Space>t*``         | (matchmaker) toggle highlighting of word under cursor
``<Space>t>``         | toggle indentation lines
``<Space>ta``         | toggle tags sidebar
``<Space>tc``         | (NERDCommenter) invert comment markers
``<Space>tC``         | (NERDCommenter) toggle alternate comment delimiters
``<Space>Tc``         | (NERDCommenter) toggle comment markers
``<Space>tG``         | (GitGutter) toggle git hunk highlighting
``<Space>tg``         | (GitGutter) toggle git hunk signs
``<Space>tl``         | (ListToggle) toggle location list
``<Space>tq``         | (ListToggle) toggle quickfix list
``<Space>tT``         | (table-mode) toggle table mode for current buffer
``<Space>tu``         | toggle undo tree/sidebar
``<Space>tv``         | (goyo) toggle distraction-free writing mode
``<Space>tV``         | (limelight) toggle enhancement for distraction-free writing mode
``<Space>tx``         | (scratch) toggle scratch buffer preview
``<Space>ug``         | (GitGutter) revert git hunk at cursor
``<Space>Uw``         | show history of recently closed windows
``<Space>uw``         | undo/restore most recently closed window
``<Space>vb``         | visually select entire buffer
``<Space>wb``         | write buffer to file
``<Space>Wb``         | write buffer to file forcefully
``<Space>Wg``         | (fugitive) git add -f: stage all changes in buffer forcefully
``<Space>wg``         | (fugitive) git add: stage all changes in buffer
``<Space>Wx``         | (slimux) send entire buffer to target pane
``<Space>wx``         | (slimux) send line or selection to target pane
``<Space>yb``         | yank buffer contents
``<Space>yc``         | (NERDCommenter) yank then comment
``<Space>Yf``         | save copy of file as...
``<Space>yf``         | save file as...
``<Space>yw``         | yank window
``<Space>Yx``         | (scratch) clear scratch buffer and yank selection to it
``<Space>yx``         | (scratch) yank selection to scratch buffer
``<Space>zR``         | widen view / disable narrowing
``<Space>zv``         | narrow view to selection
``=p``                | (unimpaired) Paste after cursor, linewise, reindenting.
``=P``                | (unimpaired) Paste before cursor, linewise, reindenting.
``>p``                | (unimpaired) Paste after cursor, linewise, increasing indent.
``>P``                | (unimpaired) Paste before cursor, linewise, increasing indent.
``[%``                | (indentwise) go to starting line of same indent, ascending [count] indents
``[+``                | (indentwise) go to previous line of deeper indent
``[-``                | (indentwise) go to previous line of lesser indent
``[<C-L>``            | (unimpaired) go to previous file with locations
``[<C-Q>``            | (unimpaired) go to previous file with quickfixes
``[<Space>``          | (unimpaired) Add [count] blank lines above the cursor.
``[=``                | (indentwise) go to previous line of same indent, crossing different indents
``[\|``               | (table-mode) move cursor to previous table cell
``[_``                | (indentwise) go to previous line of [count] indent
``[A``                | (unimpaired) go to first argument
``[a``                | (unimpaired) go to previous argument
``[B``                | (unimpaired) go to first buffer
``[b``                | (unimpaired) go to previous buffer
``[D``                | (quickfix) list definitions of word at cursor from top of file
``[e``                | (unimpaired) Exchange current line with [count] lines above it.
``[f``                | (unimpaired) go to previous file in current file's directory
``[g``                | (GitGutter) jump to previous git hunk
``[I``                | (quickfix) list occurences of word at cursor from top of file
``[L``                | (unimpaired) go to first location
``[l``                | (unimpaired) go to previous location
``[n``                | (unimpaired) go to previous conflict marker or diff/patch hunk
``[ob``               | (unimpaired) enable assuming light background
``[oC``               | (HiCterm) enable cterm color code highlighting
``[oc``               | (unimpaired) enable highlighting cursor's line
``[od``               | (unimpaired) enable diffing with current buffer
``[oh``               | (unimpaired) enable highlighting search results
``[oi``               | (unimpaired) enable ignoring case sensitivity
``[ol``               | (unimpaired) enable listing nonprintable characters
``[on``               | (unimpaired) enable absolute line numbering
``[op``               | enable verbatim paste mode
``[or``               | (unimpaired) enable relative line numbering
``[os``               | (unimpaired) enable checking for misspelled words
``[ou``               | (unimpaired) enable highlighting cursor's column
``[ov``               | (unimpaired) enable constraining cursor to line
``[ow``               | (unimpaired) enable wrapping very long lines
``[ox``               | (unimpaired) enable highlighting cursor's position
``[p``                | (unimpaired) Paste after cursor, linewise.
``[Q``                | (unimpaired) go to first quickfix
``[q``                | (unimpaired) go to previous quickfix
``[T``                | (unimpaired) go to first ctag
``[t``                | (unimpaired) go to previous ctag
``[u``                | (unimpaired) URL escape.
``[uu``               | (unimpaired) URL escape current line.
``[v``                | move cursor up as far as possible inside vertical column
``[x``                | (unimpaired) XML escape.
``[xx``               | (unimpaired) XML escape current line.
``[y``                | (unimpaired) String escape.
``[yy``               | (unimpaired) String escape current line.
``\|\|``              | (table-mode) expand borders of table header
``\|``                | (table-mode) trigger table creation in table mode
``]%``                | (indentwise) go to ending line of same indent, descending [count] indents
``]+``                | (indentwise) go to next line of deeper indent
``]-``                | (indentwise) go to next line of lesser indent
``]<C-L>``            | (unimpaired) go to next file with locations
``]<C-Q>``            | (unimpaired) go to next file with quickfixes
``]<Space>``          | (unimpaired) Add [count] blank lines below the cursor.
``]=``                | (indentwise) go to next line of same indent, crossing different indents
``]\|``               | (table-mode) move cursor to next table cell
``]_``                | (indentwise) go to next line of [count] indent
``]A``                | (unimpaired) go to last argument
``]a``                | (unimpaired) go to next argument
``]B``                | (unimpaired) go to last buffer
``]b``                | (unimpaired) go to next buffer
``]D``                | (quickfix) list definitions of word at cursor from here onward
``]e``                | (unimpaired) Exchange current line with [count] lines below it.
``]f``                | (unimpaired) go to next file in current file's directory
``]g``                | (GitGutter) jump to next git hunk
``]I``                | (quickfix) list occurences of word at cursor from here onward
``]L``                | (unimpaired) go to last location
``]l``                | (unimpaired) go to next location
``]n``                | (unimpaired) go to next conflict marker or diff/patch hunk
``]ob``               | (unimpaired) disable assuming light background
``]oC``               | (HiCterm) disable cterm color code highlighting
``]oc``               | (unimpaired) disable highlighting cursor's line
``]od``               | (unimpaired) disable diffing with current buffer
``]oh``               | (unimpaired) disable highlighting search results
``]oi``               | (unimpaired) disable ignoring case sensitivity
``]ol``               | (unimpaired) disable listing nonprintable characters
``]on``               | (unimpaired) disable absolute line numbering
``]op``               | disable verbatim paste mode
``]or``               | (unimpaired) disable relative line numbering
``]os``               | (unimpaired) disable checking for misspelled words
``]ou``               | (unimpaired) disable highlighting cursor's column
``]ov``               | (unimpaired) disable constraining cursor to line
``]ow``               | (unimpaired) disable wrapping very long lines
``]ox``               | (unimpaired) disable highlighting cursor's position
``]p``                | (unimpaired) Paste before cursor, linewise.
``]Q``                | (unimpaired) go to last quickfix
``]q``                | (unimpaired) go to next quickfix
``]T``                | (unimpaired) go to last ctag
``]t``                | (unimpaired) go to next ctag
``]u``                | (unimpaired) URL unescape.
``]uu``               | (unimpaired) URL unescape current line.
``]v``                | move cursor down as far as possible inside vertical column
``]x``                | (unimpaired) XML unescape.
``]xx``               | (unimpaired) XML unescape current line.
``]y``                | (unimpaired) String unescape.
``]yy``               | (unimpaired) String unescape current line.
``_``                 | (sneak) repeat last sneak backward
``c<Space>``          | change text starting at cursor
``cob``               | (unimpaired) toggle assuming light background
``coc``               | (unimpaired) toggle highlighting cursor's line
``cod``               | (unimpaired) toggle diffing with current buffer
``coh``               | (unimpaired) toggle highlighting search results
``coi``               | (unimpaired) toggle ignoring case sensitivity
``col``               | (unimpaired) toggle listing nonprintable characters
``con``               | (unimpaired) toggle absolute line numbering
``cop``               | toggle verbatim paste mode
``coQ``               | toggle automatic formatting in buffer
``cor``               | (unimpaired) toggle relative line numbering
``cos``               | (unimpaired) toggle checking for misspelled words
``cou``               | (unimpaired) toggle highlighting cursor's column
``cov``               | (unimpaired) toggle constraining cursor to line
``cow``               | (unimpaired) toggle wrapping very long lines
``cox``               | (unimpaired) toggle highlighting cursor's position
``coz``               | toggle code folding in buffer
``cS``                | (sandwich) change automatic delimiters surrounding specified motion
``cs``                | (sandwich) change specified delimiters surrounding specified motion
``dmx``               | (signature) Remove mark 'x' where x is a-zA-Z
``dS``                | (sandwich) delete automatic delimiters surrounding specified motion
``ds``                | (sandwich) delete specified delimiters surrounding specified motion
``F``                 | (sneak) sneak backward onto {char}
``f``                 | (sneak) sneak forward onto {char}
``g!``                | (scriptease) evaluate motion or selection as VimL and replace
``g<``                | swap delimited item to the left
``g=``                | enter interactive swapping mode
``g>``                | swap delimited item to the right
``g@``                | (FIGlet) decorate {motion} or visual selection as ASCII art
``gA``                | inspect syntax highlighting group at cursor
``ga``                | inspect Unicode for character at cursor
``gF``                | open file location (path:line,column) at cursor or in selection
``gG``                | inspect function, method, or class name at cursor
``gJ``                | (splitjoin) join lines at cursor into a single lines
``gK``                | (splitjoin) split line at cursor into multiple lines
``gl``                | (lion) left-align {motion} to [count] occurrences of {character}
``gL``                | (lion) right-align {motion} to [count] occurrences of {character}
``gr``                | Replace {motion} text with the contents of specified register.
``grr``               | Replace [count] lines with the contents of specified register.
``gS``                | (sandwich) surround inside automatic delimiters with specified delimiters
``gs``                | (sandwich) surround selection or specified motion with specified delimiters
``m'[``               | (signature) Jump by alphabetical order to start of prev line having a mark
``m']``               | (signature) Jump by alphabetical order to start of next line having a mark
``m,``                | (signature) Place the next available mark
``m-``                | (signature) Delete all marks from the current line
``m.``                | (signature) If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
``m/``                | (signature) Open location list and display marks from current buffer
``m<BS>``             | (signature) Remove all markers
``m<S-[0-9]>``        | (signature) Remove all markers of the same type
``m<Space>``          | (signature) Delete all marks from the current buffer
``m?``                | (signature) Open location list and display markers from current buffer
``m['``               | (signature) Jump to start of prev line containing a mark
``m[-``               | (signature) Jump to prev line having a marker of the same type
``m[0-9]``            | (signature) Toggle the corresponding marker !@#$%^&*()
``m[=``               | (signature) Jump to prev line having a marker of any type
``m[`​``         | (signature) Jump to prev mark
``m]'``               | (signature) Jump to start of next line containing a mark
``m]-``               | (signature) Jump to next line having a marker of the same type
``m]=``               | (signature) Jump to next line having a marker of any type
``m]`​``         | (signature) Jump to next mark
``m`​[``         | (signature) Jump by alphabetical order to prev mark
``m`​]``         | (signature) Jump by alphabetical order to next mark
``mx``                | (signature) Toggle mark 'x' and display it in the leftmost column
``S``                 | (sneak) sneak backward onto {char}{char}
``s``                 | (sneak) sneak forward onto {char}{char}
``T``                 | (sneak) sneak backward until {char}
``t``                 | (sneak) sneak forward until {char}
``va"``               | (textobj) select around double quotes
``va'``               | (textobj) select around single quotes
``va(``               | (textobj) select around () block
``va.``               | (textobj) select around sentence
``va:``               | (textobj) select around Ruby symbol
``va<``               | (textobj) select around ``<>`` block
``va<Space>``         | (textobj) select around whitespace
``va=``               | (textobj) select around merge conflict
``va>``               | (textobj) select around ``<>`` block
``va[``               | (textobj) select around [] block
``va\|``              | (textobj) select around table cell (table-mode)
``va]``               | (textobj) select around [] block
``va`​``         | (textobj) select around back quotes
``vab``               | (textobj) select around () block
``vaB``               | (textobj) select around {} block
``vaC``               | (textobj) select around comment and leading/trailing whitespace
``vac``               | (textobj) select around comment, including comment delimiters
``vad``               | (textobj) select around delimited text
``vaD``               | (textobj) select around delimited text, per alternate grouping
``vae``               | (textobj) select both sides of equation
``vaf``               | (textobj) select outer function call
``vag``               | (textobj) select around git hunk
``vai``               | (textobj) select around indentation level and line above
``vaI``               | (textobj) select around indentation level and lines above/below
``vaK``               | (textobj) select around vertical WORD column
``vak``               | (textobj) select around vertical word column
``val``               | (textobj) select around line
``van``               | (textobj) select around nearest block of specified delimiter
``vap``               | (textobj) select around paragraph
``var``               | (textobj) select around Ruby/VimL block
``vaS``               | (textobj) select around text surrounded by automatic delimiters
``vas``               | (textobj) select around text surrounded by specified delimiters
``vat``               | (textobj) select around XML tag
``vau``               | (textobj) select around URL
``vav``               | (textobj) select around variable name
``vaW``               | (textobj) select around WORD
``vaw``               | (textobj) select around word
``vax``               | (textobj) select around XML attribute
``vay``               | (textobj) select around syntax element
``va{``               | (textobj) select around {} block
``va}``               | (textobj) select around {} block
``vi"``               | (textobj) select inside double quotes
``vi'``               | (textobj) select inside single quotes
``vi(``               | (textobj) select inside () block
``vi.``               | (textobj) select inside sentence
``vi:``               | (textobj) select inside Ruby symbol
``vi<``               | (textobj) select inside ``<>`` block
``vi<Space>``         | (textobj) select inside whitespace
``vi=``               | (textobj) select inside merge conflict
``vi>``               | (textobj) select inside ``<>`` block
``vi[``               | (textobj) select inside [] block
``vi\|``              | (textobj) select inside table cell (table-mode)
``vi]``               | (textobj) select inside [] block
``vi`​``         | (textobj) select inside back quotes
``vib``               | (textobj) select inside () block
``viB``               | (textobj) select inside {} block
``vic``               | (textobj) select inside comment
``vid``               | (textobj) select inside delimited text
``viD``               | (textobj) select inside delimited text per alternate grouping
``vie``               | (textobj) select nearest side of equation
``vif``               | (textobj) select inner function call
``vig``               | (textobj) select inside git hunk
``vii``               | (textobj) select inside indentation level; no line above
``viI``               | (textobj) select inside indentation level; no lines above/below
``vik``               | (textobj) select inside vertical word column
``viK``               | (textobj) select inside vertical WORD column
``vil``               | (textobj) select inside line
``vin``               | (textobj) select inside nearest block of specified delimiter
``vip``               | (textobj) select inside paragraph
``vir``               | (textobj) select inside Ruby/VimL block
``viS``               | (textobj) select inside text surrounded by automatic delimiters
``vis``               | (textobj) select inside text surrounded by specified delimiters
``vit``               | (textobj) select inside XML tag
``viu``               | (textobj) select inside URL
``viv``               | (textobj) select inside variable name
``viW``               | (textobj) select inside WORD
``viw``               | (textobj) select inside word
``vix``               | (textobj) select inside XML attribute
``viy``               | (textobj) select inside syntax element
``vi{``               | (textobj) select inside {} block
``vi}``               | (textobj) select inside {} block
``yo``                | (unimpaired) Paste after cursor, linewise, using set 'paste'.
``yO``                | (unimpaired) Paste before cursor, linewise, using set 'paste'.
``za``                | (AnyFold) toggle fold at cursor: open and close
``ZA``                | (origami) align all folds
``Za``                | (origami) align all folds of level [count]
``Zc``                | (origami) append end foldmarker of level [count]
``ZC``                | (origami) append end foldmarker of level [count] with comment
``ZD``                | (origami) delete foldmarker from current line
``Zf``                | (origami) append start foldmarker of level [count]
``ZF``                | (origami) append start foldmarker of level [count] with comment
``zS``                | (scriptease) show active syntax highlighting groups at cursor
``{\|``               | (table-mode) move cursor to table cell above
``}\|``               | (table-mode) move cursor to table cell below

You can refresh the table above by running the following command in Vim:

```vim
call ShortcutsCheatsheetRefresh()  " defined in plugin/000/shortcut.vim
```

You can also automate the above action from the command line by running:

```sh
vim README.md -c 'call ShortcutsCheatsheetRefresh()' -c update -c quit
```

### Control

* Run `stty -ixon` before starting Vim to use `<C-S>` and `<C-Q>` keys.

* `<C-S>` saves the current buffer after stripping trailing whitespace.

* `<C-Q>` exits Vim (after confirmation if there are unsaved buffers).

* `<C-L>` clears search highlighting; recalculates hunks when diffing.

### Command

* `;` puts Vim into command mode. It is a shift-less alternative to `:`.

* `!` puts Vim into shell command mode, for shift-less entrance to `:!`.

* `@;` repeats the most recently executed command line, just like `@:`.

* `Q` formats the current paragraph or text selection, just like `gq`.

### Motion

[Sneak]( https://github.com/justinmk/vim-sneak ):

* `f` repeats last sneak or sneaks forward onto {char}
* `F` repeats last sneak or sneaks backward onto {char}
* `<Leader>f` performs a new sneak forward onto {char}
* `<Leader>F` performs a new sneak backward onto {char}
* `t` repeats last sneak or sneaks forward until {char}
* `T` repeats last sneak or sneaks backward until {char}
* `<Leader>t` performs a new sneak forward until {char}
* `<Leader>T` performs a new sneak backward until {char}
* `s` repeats last sneak or sneaks forward onto {char}{char}
* `S` repeats last sneak or sneaks backward onto {char}{char}
* `<Leader>s` performs a new sneak forward onto {char}{char}
* `<Leader>S` performs a new sneak backward onto {char}{char}

[CamelCaseMotion]( https://github.com/bkad/CamelCaseMotion ):

* `<Leader>w` is like `w` but knows about camel/snake case.
* `<Leader>b` is like `b` but knows about camel/snake case.
* `<Leader>e` is like `e` but knows about camel/snake case.

### Selection

* `gV` visually selects the most recently pasted text.
* `gn` selects the nearest search result after the cursor.
* `gN` selects the nearest search result before the cursor.

### Clipboard

* `Y` yanks from cursor to end of line, like Vim's native `C` and `D` keys.

* `<Leader>y` copies the current visual selection to the system clipboard.

### Completion

In insert mode, when the completion menu doesn't appear:

* `<C-L>` forcefully triggers completion menu to appear.

In insert mode, when the completion menu automatically appears:

* `<Enter>` accepts the currently selected completion menu item.
* `<C-J>` expands snippet or cycles forward through placeholders.
* `<C-L>` forcefully refreshes the entire completion menu.
* `<Tab>` cycles forward through completion menu items, just like `<C-N>`.
* `<S-Tab>` cycles forward through chain of completion menu sources.

See [MUcomplete.vim](https://github.com/lifepillar/vim-mucomplete)
and [NeoSnippet.vim](https://github.com/Shougo/neosnippet.vim).

### Window

Focus:

* `<A-h>` focuses window at left.
* `<A-j>` focuses window above.
* `<A-k>` focuses window below.
* `<A-l>` focuses window at right.
* `<A-;>` focuses previously focused tmux pane.

Scroll:

* `<C-Left>` scrolls window left.
* `<C-Right>` scrolls window right.
* `<C-S-Left>` scrolls window all the way left.
* `<C-S-Right>` scrolls window all the way right.

### Folding

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

### URxvt integration

If you use Vim in the URxvt terminal emulator, then load the following
snippet into xrdb(1) so you can use all the shortcuts defined in this
Vim configuration:

    xrdb -merge ~/.vim/urxvt.xrdb

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

* [Configuring Vim right](http://items.sjbach.com/319/configuring-vim-right)
  by Stephen Bach.

* [Replacing All The Things with Unite.vim](
  http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
  ) by Christopher Sexton.

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? :+1:  Please [spare a life] today as thanks!
:cow::pig::chicken::fish::speak_no_evil::v::revolving_hearts:

Copyright 2009 Suraj N. Kurapati <https://github.com/sunaku>

Distributed under the terms of the ISC license (basically MIT).
