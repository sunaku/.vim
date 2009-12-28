" http://www.vi-improved.org/vimrc.php
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" http://stackoverflow.com/questions/tagged/vim
" http://items.sjbach.com/319/configuring-vim-right
" http://push.cx/2008/256-color-xterms-in-ubuntu

set nocompatible               " explicitly get out of vi-compatible mode

"------------------------------------------------------------------------------
" appearance
"------------------------------------------------------------------------------

if has('gui_running') || &t_Co > 2
  syntax on                    " enable syntax highlighting for source code

  if has('gui_running')
    colorscheme wombat
    highlight String gui=none
    highlight ErrorMsg guibg=#e5786d
  elseif &t_Co == 256
    colorscheme wombat256
  else
    set background=dark        " optimize colors for dark background terminals
  endif
endif

set showcmd                    " show your keystrokes in normal & visual mode
set number                     " show line numbers
set novisualbell               " don't flash the screen
set list                       " reveal invisible characters:
set listchars=tab:>-,trail:~   " ... TABs and trailing spaces
set scrolloff=3                " maintain more context around the cursor

if has('gui_running')
  set guicursor+=a:blinkwait0  " prevent the cursor from blinking
  set guifont=Monospace\ 11
end

"------------------------------------------------------------------------------
" interaction
"------------------------------------------------------------------------------

let mapleader=','              " use comma as the <leader> key
set mouse=a                    " enable mouse clicking & selection
set backspace=indent,eol,start " make backspace work as you'd expect

set confirm                    " ask user before aborting an action
set autochdir                  " switch to current file's parent directory
set hidden                     " you can change buffers without saving

set wildmenu                   " turn on command line completion wild style
set wildmode=list:longest,full " turn on wild mode huge list

set incsearch                  " highlight matches while searching
set ignorecase                 " make searching case insensitive
set smartcase                  " ... unless the query contains capital letters

set foldenable
set foldmethod=syntax          " use syntax highlighting rules to define folds
set foldlevel=1                " start out with only root-level folds open

"------------------------------------------------------------------------------
" formatting
"------------------------------------------------------------------------------

set autoindent                 " enable auto-indentation of input
set textwidth=79               " hard-wrap long lines as you type them
match ErrorMsg '\%<81v.\%>80v' " visually indicate the hard-wrap limit

set tabstop=8                  " render TABs using this many spaces
set expandtab                  " insert spaces when TAB is pressed
set softtabstop=2              " ... this many spaces
set shiftwidth=2               " indentation amount for << and >> commands

"------------------------------------------------------------------------------
" file types
"------------------------------------------------------------------------------

filetype on                    " auto-detect the file type
filetype plugin on             " enable file type specific plugins

autocmd FileType make setlocal noexpandtab
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType gitcommit setlocal textwidth=50

"------------------------------------------------------------------------------
" saving & loading
"------------------------------------------------------------------------------

" remove trailing spaces before saving the file
" and preserve the cursor position while doing so
"
" http://vim.wikia.com/wiki/Remove_trailing_spaces
"
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<Enter>
    normal `z
  endif
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

"------------------------------------------------------------------------------
" plugins & shortcuts
"------------------------------------------------------------------------------

" comment header
nmap <leader>- 78A-<Esc>,cc^

" buffer management
nnoremap <leader>b :ls<Enter>:buffer<Space>

" toggle line numbers
nnoremap <leader>n :set number!<Enter>

" list all occurrences of word under cursor in current buffer
nnoremap <leader>* [I

" tabs for buffers
let g:buftabs_only_basename=1
let g:buftabs_active_highlight_group='Visual'

" file system browser
nnoremap <leader>t :NERDTreeToggle<Enter>
nnoremap <leader>T :NERDTreeFind<Enter>

" recently opened files
let MRU_Exclude_Files='\.git/'
nnoremap <leader>o :MRU<Enter>

" source code browser
nnoremap <leader>s :TlistToggle<Enter>
nnoremap <leader>S :TlistShowPrototype<Enter>

" switch between single and double quotes using the surround plugin
"
" NOTE: we explictly set a temporary marker (z) and restore it after
"       the surround operation because the surround plugin does not
"       restore the cursor position after the surround operation; it
"       leaves the cursor at the opening quote of the operand instead!
"
nmap <leader>' mzcs"'`z
nmap <leader>" mzcs'"`z
