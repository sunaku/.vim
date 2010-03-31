" http://www.vi-improved.org/vimrc.php
" http://vim.wikia.com/wiki/Example_vimrc
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" http://stackoverflow.com/questions/tagged/vim
" http://items.sjbach.com/319/configuring-vim-right
" http://push.cx/2008/256-color-xterms-in-ubuntu

source ~/.vim/vimrc_example.vim

"-----------------------------------------------------------------------------
" appearance
"-----------------------------------------------------------------------------

  if has('gui_running')
    colorscheme wombat

    " remove italic style
    highlight String gui=none
    highlight Comment gui=none

    " make cursor noticable
    highlight Cursor guibg=#e5786d guifg=#000000

    highlight clear Search
    highlight link Search PmenuSel

  elseif &t_Co == 256
    colorscheme zenburn

    " remove italic style
    highlight Comment gui=none

  elseif &t_Co == 88
    colorscheme wombat256

  elseif &t_Co > 2
    set background=dark          " optimize colors for dark terminals
  endif

  highlight link MyTagListFileName Pmenu

  if has('gui_running')
    set guicursor+=a:blinkwait0  " prevent the cursor from blinking
    set guifont=Monospace\ 11
  end

  set number                     " show line numbers
  set scrolloff=3                " context lines around cursor
  set novisualbell               " don't flash the screen
  set laststatus=2               " always show status line

  set list                       " reveal invisible characters:
  set listchars=tab:>-,trail:~   " ... TABs and trailing spaces

  set foldenable
  set foldmethod=syntax          " syntax highlighting rules define folds
  set foldlevelstart=10          " close folds below this depth, initially

"-----------------------------------------------------------------------------
" interaction
"-----------------------------------------------------------------------------

  let mapleader=','              " the <Leader> key used in shortcuts

  set history=1000               " remember this many commands & searches
  set confirm                    " ask user before aborting an action
  set autochdir                  " switch to current file's parent directory
  set hidden                     " you can change buffers without saving

  set wildmenu                   " turn on command line completion wild style
  set wildmode=list:longest,full " turn on wild mode huge list

  set ignorecase                 " make searching case insensitive
  set smartcase                  " ... unless the query has capital letters

"-----------------------------------------------------------------------------
" formatting
"-----------------------------------------------------------------------------

  set autoindent                 " automatically indent new lines
  set formatoptions+=o           " continue comment marker in new lines
  set textwidth=78               " hard-wrap long lines as you type them
  set tabstop=8                  " render TABs using this many spaces
  set expandtab                  " insert spaces when TAB is pressed
  set softtabstop=2              " ... this many spaces
  set shiftwidth=2               " indentation amount for < and > commands

"-----------------------------------------------------------------------------
" file types
"-----------------------------------------------------------------------------

  autocmd FileType make setlocal noexpandtab
  autocmd FileType gitcommit setlocal textwidth=72 nofoldenable
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType text,yaml,eruby,haml,sass setlocal foldmethod=indent
  autocmd FileType haml setlocal textwidth=0
  autocmd FileType mail setlocal textwidth=72
  autocmd FileType diff setlocal textwidth+=1 " extra char for +/-/ indicators

  " allow leading space before the initial "%" in shorthand eRuby directives
  " this snippet is originally from /usr/share/vim/vim72/syntax/eruby.vim:58
  autocmd FileType eruby exe 'syn region  erubyOneLiner   matchgroup=erubyDelimiter start="^ *%\{1,'.b:eruby_nest_level.'\}%\@!"    end="$"     contains=@rubyTop        containedin=ALLBUT,@erubyRegions keepend oneline'

"-----------------------------------------------------------------------------
" saving
"-----------------------------------------------------------------------------

  " keep backup & swap files in Vim config dir
  set backupdir=~/.vim/tmp
  execute "set directory=". &backupdir
  silent execute '!mkdir -p '. &backupdir

  " remove trailing spaces before saving text files
  " http://vim.wikia.com/wiki/Remove_trailing_spaces
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

"-----------------------------------------------------------------------------
" shortcuts
"-----------------------------------------------------------------------------

  " helper for testing out new shortcuts
  function! TestShortcut(shortcut)
    let label = substitute(a:shortcut, '[<>]', ' ', 'g')
    exec "noremap ". a:shortcut ." :echo '". label ."'<Enter>"
  endfunction

  " make the non-graphical Vim recognize <Alt><Number> key combinations
  " http://vim.wikia.com/wiki/Fix_meta-keys_that_break_out_of_Insert_mode
  if ! has('gui_running')
    let i = 0
    while i < 10
      exec "set <A-". i .">=\e". i
      let i += 1
    endwhile
  endif

"-----------------------------------------------------------------------------
" shortcuts
"-----------------------------------------------------------------------------

  "---------------------------------------------------------------------------
  " editor
  "---------------------------------------------------------------------------

    nnoremap <Leader>q :q<Enter>
    nnoremap <Leader>Q :qa<Enter>

    " map <C-L> (redraw screen) to also turn off
    " search highlighting until the next search
    " http://vim.wikia.com/wiki/Example_vimrc
    nnoremap <C-L> :nohlsearch<Enter><C-L>

    nnoremap <Leader>tc :call CycleTerminalPaletteSize()<Enter>
    function! CycleTerminalPaletteSize()
      " choose new palette size
      if &t_Co == 8
        set t_Co=88

      elseif &t_Co == 88
        set t_Co=256

      elseif &t_Co == 256
        set t_Co=8
      endif

      " show new palette size
      redraw
      echo &t_Co
    endfunction

    nnoremap <Leader>th :set nohlsearch!<Enter>
    nnoremap <Leader>tn :set number!<Enter>
    nnoremap <Leader>tz :set foldenable!<Enter>

    " highlight text that exceeds the textwidth limit
    " http://vim.wikia.com/wiki/Highlight_long_lines
    autocmd BufWinEnter * :call ApplyTextWidthOverflowHighlighting()
    function! ApplyTextWidthOverflowHighlighting()
      if &textwidth > 0 && !exists('w:text_width_overflow_highlighting')
        let w:text_width_overflow_highlighting =
              \ matchadd('WarningMsg', '\%>'. &textwidth .'v.\+', -1)
      endif
    endfunction

    nnoremap <Leader>tw :call ToggleTextWidthOverflowHighlighting()<Enter>
    function! ToggleTextWidthOverflowHighlighting()
      if exists('w:text_width_overflow_highlighting')
        call matchdelete(w:text_width_overflow_highlighting)
        unlet w:text_width_overflow_highlighting
      else
        call ApplyTextWidthOverflowHighlighting()
      endif
    endfunction

  "---------------------------------------------------------------------------
  " tags
  "---------------------------------------------------------------------------

    let Tlist_Sort_Type = 'name'
    let Tlist_Use_Right_Window = 1
    let Tlist_Enable_Fold_Column = 0
    let Tlist_GainFocus_On_ToggleOpen = 1
    let Tlist_Exit_OnlyWindow = 1
    let Tlist_Use_SingleClick = 1

    nnoremap <Leader>s :TlistToggle<Enter>
    nnoremap <Leader>S :TlistShowPrototype<Enter>

  "---------------------------------------------------------------------------
  " files
  "---------------------------------------------------------------------------

    " fuzzy finder
    let g:fuf_modesDisable = [ 'mrucmd' ]
    let g:fuf_previewHeight = 0
    let g:fuf_keyOpenSplit = '<A-2>'
    let g:fuf_keyOpenVsplit = '<A-3>'

    " XXX: the first regexp line in the assignment below
    "      was copied from `:help g:fuf_file_exclude@en`
    let g:fuf_mrufile_exclude =
          \ '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
          \ . '|^/tmp/|^/var/tmp/|^\~/tmp/'
          \ . '|\.git'

    nnoremap <Leader>o :FufFile<Enter>
    nnoremap <Leader>O :FufMruFile<Enter>

    " file system browser
    nnoremap <Leader>f :NERDTreeToggle<Enter>
    nnoremap <Leader>F :NERDTreeFind<Enter>

  "---------------------------------------------------------------------------
  " buffers
  "---------------------------------------------------------------------------

    nnoremap <C-PageUp> :bprev<Enter>
    execute "nnoremap \e[5^ :bprev<Enter>"

    nnoremap <C-PageDown> :bnext<Enter>
    execute "nnoremap \e[6^ :bnext<Enter>"

    nnoremap <A-6> :FufBuffer<Enter>
    nnoremap <Leader>4 :bdelete<Enter>
    nnoremap <Leader>l :checktime<Enter>
    nnoremap <Leader>w :write<Enter>
    nnoremap <Leader>W :saveas<Space>

  "---------------------------------------------------------------------------
  " splits
  "---------------------------------------------------------------------------

    nnoremap <A-PageUp> <C-W>W
    execute "nnoremap \e\e[5~ <C-W>W"

    nnoremap <A-PageDown> <C-W>w
    execute "nnoremap \e\e[6~ <C-W>w"

    nnoremap <A-1> <C-W>o
    nnoremap <A-2> <C-W>s <C-W><Down>
    nnoremap <A-3> <C-W>v <C-W><Right>
    nnoremap <A-4> <C-W>c
    nnoremap <A-5> <C-W>=
    nnoremap <A-7> <C-W>_
    nnoremap <A-8> <C-W>1_
    nnoremap <A-9> <C-W><Bar>
    nnoremap <A-0> <C-W>1<Bar>

  "---------------------------------------------------------------------------
  " folds
  "---------------------------------------------------------------------------

    nnoremap z<Up> zk
    nnoremap z<Down> zj
    nnoremap zp zk
    nnoremap zn zj
    nnoremap <A-Up> zk
    nnoremap <A-Down> zj

    nnoremap <Space> zo
    nnoremap <S-Space> zO
    nnoremap <Backspace> zc
    nnoremap <S-Backspace> zM zv zc

    nnoremap <A-Left> zm
    nnoremap <AS-Left> zM
    nnoremap <A-Right> zr
    nnoremap <AS-Right> zR

  "---------------------------------------------------------------------------
  " editing
  "---------------------------------------------------------------------------

    " be consistent (EOL behavior) with other capitalized C and D commands
    nnoremap Y y$

    " list all occurrences of word under cursor in current buffer
    nnoremap <Leader>* [I

    " switch between single and double quotes
    "
    " NOTE: we explictly set a temporary marker (z) and restore
    "       it after the surround operation because otherwise the
    "       surround plugin will move the cursor to the opening
    "       quote of the operand after the operation, instead of
    "       keeping the cursor where it was before the operation
    "
    nmap <Leader>' mzcs"'`z
    nmap <Leader>" mzcs'"`z

    " insert or update section separator at end of current line
    nnoremap <Leader>- 80A-<Esc>:execute 's/\%>'. &textwidth .'v.//g'<Enter>

  "---------------------------------------------------------------------------
  " rails
  "---------------------------------------------------------------------------

    nnoremap <Leader>r :R
    nnoremap <Leader>R :A
