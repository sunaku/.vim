" http://www.vi-improved.org/vimrc.php
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" http://stackoverflow.com/questions/tagged/vim
" http://items.sjbach.com/319/configuring-vim-right

set nocompatible               " explicitly get out of vi-compatible mode

"-------------------------------------------------------------------------------
" controls
"-------------------------------------------------------------------------------

let mapleader=','              " defines the value of <leader> key
set mouse=a                    " enable mouse clicking & selection
set backspace=indent,eol,start " make backspace work as you'd expect

noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>T :NERDTreeFind<CR>

let MRU_Exclude_Files='\.git/COMMIT_EDITMSG$'
noremap <leader>r :MRU<CR>

"-------------------------------------------------------------------------------
" appearance
"-------------------------------------------------------------------------------

if has('gui_running')
  set gcr+=a:blinkwait0        " prevent cursor from blinking
  set guifont=Monospace\ 11
  colorscheme wombat
else
  set background=dark          " make colors readable in dark terminals
endif

set number                     " show line numbers
set novisualbell               " don't flash the screen
set list listchars=tab:>-      " reveal TAB characters
set scrolloff=3                " maintain more context around the cursor

"-------------------------------------------------------------------------------
" interaction
"-------------------------------------------------------------------------------

set confirm                    " ask user before aborting an action
set shortmess=atI              " disable "Press ENTER" prompt after :%! filters

set autochdir                  " switch to current file's parent directory
set hidden                     " you can change buffers without saving

set wildmenu                   " turn on command line completion wild style
set wildmode=list:longest,full " turn on wild mode huge list

set incsearch                  " highlight matches while searching
set ignorecase                 " make searching case insensitive
set smartcase                  " ... unless the query contains capital letters

set foldenable
set foldmethod=indent
set foldlevel=100              " open (almost) all folds by default

"-------------------------------------------------------------------------------
" formatting
"-------------------------------------------------------------------------------

set autoindent                 " enable auto-indentation of input
set formatoptions+=o           " retain comment marker when adding new lines
set textwidth=80               " hard-wrap long lines as you type them
match ErrorMsg '\%>80v.\+'     " highlight overflow beyond 80 characters

set tabstop=8                  " render TABs using this many spaces
set expandtab                  " insert spaces when TAB is pressed
set softtabstop=2              " ... this many spaces
set shiftwidth=2               " indentation amount for << and >> commands

"-------------------------------------------------------------------------------
" file types
"-------------------------------------------------------------------------------

syntax on                      " enable syntax highlighting
filetype on                    " auto-detect the file type
filetype plugin on             " enable file type specific plugins
filetype indent on             " indent according to file type

autocmd FileType make set noexpandtab
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"-------------------------------------------------------------------------------
" saving & loading
"-------------------------------------------------------------------------------

" remove trailing spaces before saving the file
" and preserve the cursor position while doing so
" http://vim.wikia.com/wiki/Remove_trailing_spaces
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  normal mz
  normal Hmy
  %s/\s\+$//e
  normal 'yz<Enter>
  normal `z
endfunction

" Tell vim to remember certain things when we exit
set viminfo='1000,<1000,:100,h

" restore cursor position when re-opening file
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
augroup JumpCursorOnEdit
  autocmd!

  " when we reload, tell vim to restore the cursor to the saved position
  autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP                                             |
        \   if line("'\"") > 1 && line("'\"") <= line("$")                               |
        \     let JumpCursorOnEdit_foo = line("'\"")                                     |
        \     let b:doopenfold = 1                                                       |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1                     |
        \        let b:doopenfold = 2                                                    |
        \     endif                                                                      |
        \     exe JumpCursorOnEdit_foo                                                   |
        \   endif                                                                        |
        \ endif

  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv"         |
        \   if(b:doopenfold > 1)    |
        \       exe "+".1           |
        \   endif                   |
        \   unlet b:doopenfold      |
        \ endif
augroup END
