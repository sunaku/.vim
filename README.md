# A modular Vim configuration

Unlike most Vim configurations you find online, this one is _modular_: it's
*not* a monolithic `vimrc` file!  May it help you journey the lands of Vim.

Don't forget to check out the handy [list of shortcuts](#shortcuts) below!

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

* `recolor/*.vim` configure your colorschemes _after_ they are applied.

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

## Shortcuts

This branch of the Vim configuration defines the following shortcuts.

Tips:
* `<C-c>` is like `<Esc>` but it doesn't break macros containing the Alt key.
* Run `stty -ixon` before launching Vim to use `<C-s>` and `<C-q>` shortcuts.

### Leader

* `,` is the `<Leader>`: a prefix for shortcuts in this configuration.

### Command

* `;` puts Vim into command mode. It is a shift-less alternative to `:`.
* `!` puts Vim into command mode, ready to run an external shell command.

### Undo

* `U` re-does the last undone change.  It is the same as `<C-r>` in Vim.
* `<Leader>.u` toggles the undo tree: a history of edits to current buffer.

### Quit

* `<C-q>` quits Vim.
* `<Leader><C-q>` closes all buffers and all windows _without_ quitting Vim.

### File

* `<Leader>a` opens a file in/under working directory or code repository.
* `<Leader>A` opens a file in/under directory relative to current buffer.
* `<Leader>o` opens/creates a file in working directory.
* `<leader>O` opens/creates a file relative to current buffer.
* `<Leader>f` browses working directory.
* `<Leader>F` browses directory that contains current buffer.

### Window

* `<Leader>1` maximizes current window by collapsing others.
* `<Leader>!` closes all windows except current window.
* `<Leader>2` creates new window below current window.
* `<Leader>3` creates new window to the right of current window.
* `<Leader>4` closes current window.
* `<Leader>^` restores closed window.
* `<Leader>0` divides screen equally amongst all windows.

Focus:
* `<A-PageUp>` focuses next window.
* `<A-PageDown>` focuses previous window.
* `<A-d>` focuses previously focused tmux pane.
* `<A-h>` focuses window at left.
* `<A-t>` focuses window above.
* `<A-n>` focuses window below.
* `<A-s>` focuses window at right.

> NOTE: [I type Dvorak](http://www.dvzine.org), hence the D-H-T-N-S above.

Scroll:
* `<C-Left>` scrolls window left.
* `<C-Right>` scrolls window right.
* `<C-S-Left>` scrolls window all the way left.
* `<C-S-Right>` scrolls window all the way right.

### Tab

* `<Leader><PageUp>` selects previous tab.
* `<Leader><PageDown>` selects next tab.

### Buffer

* `<C-s>` strips trailing whitespace from current buffer and writes to disk.
* `<Leader><C-s>` strips trailing whitespace from current buffer.
* `<Leader>$` closes current buffer while retaining current window.
* `<Leader>6` chooses a buffer to edit in current window.
* `<Leader>7` discards unsaved changes and reloads current buffer from disk.
* `<C-PageUp>` displays previous buffer in current window.
* `<C-PageDown>` displays next buffer in current window.

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
* `<Leader>z` closes all folds except those containing cursor.

[Narrow](https://github.com/kana/vim-narrow#readme):
* `<Leader>n` hides all text outside the visual selection.
* `<Leader>N` makes hidden text visible again.

### Text object

* `_` is for [underscored text](https://github.com/lucapette/vim-textobj-underscore).
* `a` is for function arguments.
* `c` is for [code comments](https://github.com/glts/vim-textobj-comment).
* `e` is for [the entire buffer](https://github.com/kana/vim-textobj-entire).
* `f` is for [text in between](https://github.com/thinca/vim-textobj-between).
* `h` is for [modified hunks](https://github.com/thinca/vim-textobj-between).
* `i` is for [indentation](https://github.com/thinca/vim-textobj-between).
* `k` is for [vertical columns](https://github.com/coderifous/textobj-word-column.vim).
* `K` is for vertical WORD columns.
* `l` is for [the current line](https://github.com/kana/vim-textobj-line).
* `o` is for [indented text](https://github.com/glts/vim-textobj-indblock).
* `q` is for [quoted text](https://github.com/beloglazov/vim-textobj-quotes).
* `r` is for block structures.
* `u` is for [URLs](https://github.com/mattn/vim-textobj-url).
* `v` is for [variable names](https://github.com/robmiller/vim-movar).
* `y` is for [syntax elements](https://github.com/kana/vim-textobj-syntax).
* `<Space>` is for [whitespace](https://github.com/vim-utils/vim-space).

[vim-after-object](https://github.com/junegunn/vim-after-object):
* `v[=` looks behind and selects right-hand side of equal sign.
* `v]=` looks ahead and selects right-hand side of equal sign.
* `v[:` looks behind and selects right-hand side of colon.
* `v]:` looks ahead and selects right-hand side of colon.
* `v[-` looks behind and selects right-hand side of minus sign.
* `v]-` looks ahead and selects right-hand side of minus sign.
* `v[#` looks behind and selects right-hand side of pound sign.
* `v]#` looks ahead and selects right-hand side of pound sign.
* `v[<Space>` looks behind and selects right-hand side of space.
* `v]<Space>` looks ahead and selects right-hand side of space.

### Search

* `gA` shows syntax highlighting style for word under cursor.
* `g]` shows (exuberant c)tag associated with cursor location.
* `<C-l>` clears search result highlighting.
* `<Leader>c/` finds merge conflict markers.
* `<Leader>*` chooses a line containing word under cursor to jump to.
* `<Leader>8` chooses a line matching input regexp to jump to.
* `<Leader>[` chooses a section in current buffer to jump to.
* `<Leader>\` chooses a recent command line to execute.
* `<Leader>]` chooses a (exuberant c)tag to jump to.
* `<Leader>`\` chooses a mark or recent jump location to jump to.
* `<Leader>s` starts an interactive search-and-replace.
* `-` repeats the current `f`,`F`,`t`,`T` forward like the original `;` does.
* `_` repeats the current `f`,`F`,`t`,`T` backward like the original `,` does.
* `<Leader>f` jumps to character, showing landing locations on the screen.
* `<Leader>F` jumps to search result, showing landing locations on the screen.

### Select

* `gV` selects last edited or pasted region.
* `g/` selects next nearest search result.
* `g?` selects previous nearest search result.

### Yank

* `Y` yanks from cursor to end of line, like Vim's `C` and `D` shortcuts.
* `<Leader>y` copies the current visual selection to the system clipboard.

### Paste

* `<leader>P` chooses a recent yank to paste before cursor.
* `<leader>p` chooses a recent yank to paste after cursor.
* `<Leader>@` chooses a register value to paste.

### Format

Indent:
* `<Leader>=<Tab>` disables "2 spaces equals 1 tab" indentation style.
* `<Leader>=<Space>` enables "2 spaces equals 1 tab" indentation style.

Decorate:
* `<Leader>=-` inserts or updates section separator at end of current line.
* `<Leader>=_` repeats last character to the maximum width of current line.

Markdown:
* `<Leader>=1` formats current line as a top-level heading in Markdown.
* `<Leader>=2` formats current line as a second-level heading in Markdown.
* `<Leader>=`\` converts Markdown indented code block into fenced code block.
* `<Leader>=|` converts Markdown table heading into a heading/body separator.

[Figlet](https://github.com/sunaku/Figlet.vim):
* `g@` runs selection or motion through Figlet
* `<Leader>c@` runs selection or motion through Figlet and then comments it

[Switch](https://github.com/AndrewRadev/switch.vim#readme):
* `<Leader><Leader>` cycles through alternatives for text under cursor.

[Surround](https://github.com/tpope/vim-surround#readme):
* In visual mode, lowercase `s` also activates the Surround plugin.
* `<Leader>'` switches from double quotes to single quotes.
* `<Leader>"` switches from single quotes to double quotes.
* `<Leader>:` switches from single quotes to Ruby symbol notation.
* `<Leader>;` switches from Ruby symbol notation to single quotes.
* `<Leader>(` surrounds function call arguments with parentheses.
* `<Leader>)` removes parentheses around function call arguments.

### Toggle

Options:
* `coN` toggles relative line numbering.
* `cof` toggles automatic formatting.
* `cop` toggles paste mode.
* `cos` toggles spell check.
* `coz` toggles code folding.

[Unimpaired](https://github.com/tpope/vim-unimpaired#readme):
* `coc` toggles highlighting the current line.
* `coh` toggles highlighting search results.
* `col` toggles displaying non-printable characters.
* `con` toggles line numbering.
* `cor` toggles relative line numbering.
* `cos` toggles spell check.
* `cou` toggles highlighting the current column.

Plugins:
* `<Leader>.'` toggles quickfix window.
* `<Leader>.<Space>` toggles [Goyo] for distraction-free writing.
* `<Leader>.C` toggles automatic text completion.
* `<Leader>.G` toggles highlighting of Git changes in current buffer.
* `<Leader>.I` toggles display of indentation line guides.
* `<Leader>.]` toggles the tag list: an outline of current (exuberant c)tags.
* `<Leader>.c` toggles highlighting CSS color values.
* `<Leader>.g` toggles gutter that tracks Git changes in current buffer.
* `<Leader>.u` toggles the undo tree: a history of edits to current buffer.
* `<Leader>.w` toggles highlighting of repetitions of word under cursor.

[Goyo]: https://github.com/junegunn/goyo.vim#readme

### Diff

* `<Leader>db` diffs current buffer.
* `<Leader>df` diffs current buffer against original file.
* `<Leader>dl` puts change into left-hand buffer in 3-way diff.
* `<Leader>dr` puts change into right-hand buffer in 3-way diff.
* `<Leader>dL` obtains change from left-hand buffer in 3-way diff.
* `<Leader>dR` obtains change from right-hand buffer in 3-way diff.
* `<Leader>du` updates differences; run this after you make changes.
* `<Leader>dq` quits diff mode.

### Comment

See [NERDCommenter](https://github.com/scrooloose/nerdcommenter#readme).

* `<Leader>cP` comments out visual selection or current line and then
               pastes the original (uncommented) version before it.
* `<Leader>cp` comments out visual selection or current line and then
               pastes the original (uncommented) version after it.

### Complete

See [NeoComplete](https://github.com/Shougo/neocomplete.vim#readme)
and [NeoSnippet](https://github.com/Shougo/neosnippet.vim#readme).

In insert mode, when auto-completion menu appears:
* `<Return>` accepts chosen completion and starts new line.
* `<Tab>` cycles forward through completion choices.
* `<C-j>` expands snippet for chosen completion.
* `<C-S-j>` accepts common prefix of completion choices.
* `<C-u>` forgets chosen completion so you can choose again.
* `<C-g>` cancels completion.

### Git

See [Fugitive](https://github.com/tpope/fugitive#readme)
and [Extradite](https://github.com/int3/vim-extradite#readme)
and [GitGutter](https://github.com/airblade/vim-gitgutter#readme).

* `[g` jumps to previous Git change in current buffer.
* `]g` jumps to next Git change in current buffer.
* `<Leader>gb` runs Git blame on current buffer.
* `<Leader>gc` runs Git commit.
* `<Leader>gd` runs Git diff on current buffer.
* `<Leader>ge` reverts current buffer to Git version.
* `<Leader>gg` runs Git grep.
* `<Leader>g.` changes Vim's working directory to Git clone's root.
* `<Leader>gl` runs Git log on current buffer.
* `<Leader>gm` moves/renames current file.
* `<Leader>gM` moves/renames current file, with force.
* `<Leader>gr` reads Git version into buffer.
* `<Leader>gR` reads Git version into buffer, discarding unsaved changes.
* `<Leader>gs` runs Git status.
* `<Leader>gw` stages current buffer.
* `<Leader>gW` stages current buffer, with force.
* `<Leader>gx` stages current file for deletion.
* `<Leader>gX` stages current file for deletion, with force.

### TMUX

See [Slimux](https://github.com/epeli/slimux#readme).

REPL:
* `<Leader>to` chooses a tmux pane to receive arbitrary text sent from Vim.
  * `d` displays tmux pane numbers.
  * `q` quits the menu of choices.
* `<Leader>ts` sends visual selection or current line to chosen tmux pane.

Shell:
* `<Leader>tO` chooses a tmux pane to receive shell commands sent from Vim.
  * `d` displays tmux pane numbers.
  * `q` quits the menu of choices.
* `<Leader>tr` sends current shell command to chosen tmux pane.
* `<Leader>tR` resends last shell command to chosen tmux pane.

### Zeal

See http://zealdocs.org

* `<Leader>k` prompts for a query to search for.
* `<Leader>K` searches for the word under cursor or the visual selection.
* `<Leader><C-k>` prompts for a docset to use.

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
