" http://www.vi-improved.org/vimrc.php
" http://vim.wikia.com/wiki/Example_vimrc
" http://vim.wikia.com/wiki/Vim_Tips_Wiki
" http://stackoverflow.com/questions/tagged/vim
" http://items.sjbach.com/319/configuring-vim-right
" http://push.cx/2008/256-color-xterms-in-ubuntu
" http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
" http://vim.wikia.com/wiki/Single_tags_file_for_a_source_tree
" http://vimcasts.org/episodes/bubbling-text/

"-----------------------------------------------------------------------------
" bootstrap
"-----------------------------------------------------------------------------

" base this configuration on the official example vimrc,
" which is maintained by the great Bram Moolenaar himself!
silent! execute 'source '. globpath(&runtimepath, 'vimrc_example.vim')
if has('gui_running')
  silent! execute 'source '. globpath(&runtimepath, 'gvimrc_example.vim')
endif

" register bundles found in the runtimepath
let s:bundles = tr(globpath(&runtimepath, 'bundle/*/.'), "\n", ',')
let s:afters = tr(globpath(s:bundles, 'after/.'), "\n", ',')
let &runtimepath = join([s:bundles, &runtimepath, s:afters], ',')

" activate ftplugin/ scripts inside bundles
filetype off
filetype plugin indent on

"-----------------------------------------------------------------------------
" appearance
"-----------------------------------------------------------------------------

set colorcolumn=+1              " show textwidth limit
autocmd ColorScheme * highlight! link ColorColumn StatusLineNC

if has('gui_running')
  colorscheme wombat
elseif &t_Co > 8
  colorscheme zenburn
elseif &term == 'linux'
  set background=dark
else
  set background=light
end

set number                      " show line numbers
set scrolloff=3                 " context lines around cursor
set novisualbell                " don't flash the screen
set laststatus=2                " always show status line
set guicursor+=a:blinkwait0     " disable cursor blink in gvim
set guifont=Tamsyn\ 12,Monospace\ 9

set foldenable
set foldmethod=indent           " indentation defines folds
set foldlevelstart=10           " close folds below this depth, initially

"-----------------------------------------------------------------------------
" interaction
"-----------------------------------------------------------------------------

let mapleader=','               " the <Leader> key used in shortcuts

set shell=/bin/sh               " use Bourne shell for command substitution
set history=1000                " remember this many commands & searches
set confirm                     " ask user before aborting an action
set hidden                      " you can change buffers without saving

set autochdir                   " switch to current file's parent directory
set tags=tags;                  " ... and search up the tree for ctags files

set wildmenu                    " turn on command line completion wild style
set wildmode=list:longest,full  " turn on wild mode huge list

set ignorecase                  " make searching case insensitive
set smartcase                   " ... unless the query has capital letters

"-----------------------------------------------------------------------------
" formatting
"-----------------------------------------------------------------------------

set autoindent                  " automatically indent new lines
set formatoptions+=o            " continue comment marker in new lines
set textwidth=78                " hard-wrap long lines as you type them
set tabstop=8                   " render TABs using this many spaces
set expandtab                   " insert spaces when TAB is pressed
set softtabstop=2               " ... this many spaces
set shiftwidth=2                " indentation amount for < and > commands

"-----------------------------------------------------------------------------
" file types
"-----------------------------------------------------------------------------

autocmd FileType make setlocal noexpandtab
autocmd FileType gitcommit setlocal textwidth=72 nofoldenable
autocmd FileType ruby,eruby setlocal complete-=i
autocmd FileType text,yaml,eruby,haml,sass setlocal foldmethod=indent
autocmd FileType qf,conf,crontab,html,haml setlocal textwidth=0
autocmd FileType mail setlocal textwidth=68
autocmd FileType diff setlocal textwidth+=1 " extra char for +/- indicators

" allow leading space before the initial "%" in shorthand eRuby directives
" XXX: this code is originally from /usr/share/vim/vim72/syntax/eruby.vim:58
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
  execute "noremap ". a:shortcut ." :echo '". label ."'<Enter>"
endfunction

" make the non-graphical Vim recognize <Alt><Number> key combinations
" http://vim.wikia.com/wiki/Fix_meta-keys_that_break_out_of_Insert_mode
if !has('gui_running')
  let i = 0
  while i < 10
    execute "set <A-". i .">=\e". i
    let i += 1
  endwhile
endif

" fix arrow keys in insert mode
if &term == 'rxvt-unicode-256color'
  execute "inoremap \e[OA <Up>"
endif

" quickly exit from Vim
nnoremap <Leader>q :q<Enter>
nnoremap <Leader>Q :qa<Enter>

" be consistent (go to EOL) with capitalized C and D commands
nnoremap Y y$

" treat wrapped lines like real lines
nnoremap <Up> gk
nnoremap <Down> gj

" retain relative cursor position when paging the screen
nnoremap <PageUp> <C-U>
nnoremap <PageDown> <C-D>

" list all occurrences of word under cursor in current buffer
nnoremap <Leader>* [I

" make <C-L> (redraw screen) also turn off
" search highlighting until the next search
" http://vim.wikia.com/wiki/Example_vimrc
nnoremap <C-L> :nohlsearch<Enter><C-L>

" switch between single and double quotes
"
" NOTE: we explicitly set a temporary marker (z) and restore
"       it after the surround operation because otherwise the
"       surround plugin will move the cursor to the opening
"       quote of the operand after the operation, instead of
"       keeping the cursor where it was before the operation
"
nmap <Leader>' mzcs"'`z
nmap <Leader>" mzcs'"`z

" repeat last character to the maximum width of current line
nnoremap <Leader>_ :execute 's/.$/'. repeat('&', &textwidth+1) .'/'<Enter>
      \:execute 's/\%>'. &textwidth .'v.//g'<Enter>

" insert or update section separator at end of current line
nmap <Leader>- A-<Esc><Leader>_

" find merge conflict markers
nnoremap <Leader>/c :set hlsearch<Enter> /^[<=>]\{7\}/<Enter>

" visually select the text that was last edited or pasted
nnoremap gV `[v`]

" use extended regular expression syntax when searching
noremap ? ?\v
noremap / /\v

"-----------------------------------------------------------------------------
" toggles
"-----------------------------------------------------------------------------

nnoremap <Leader>ts :set spell!<Enter>
nnoremap <Leader>th :set nohlsearch!<Enter>
nnoremap <Leader>tn :set number!<Enter>
nnoremap <Leader>tz :set foldenable!<Enter>
nnoremap <Leader>tp :set paste!<Enter>

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

"-----------------------------------------------------------------------------
" tags
"-----------------------------------------------------------------------------

let Tlist_Sort_Type = 'name'
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1

nnoremap <Leader>s :TlistToggle<Enter>
nnoremap <Leader>S :TlistShowPrototype<Enter>

"-----------------------------------------------------------------------------
" files
"-----------------------------------------------------------------------------

" fuzzy finder
let g:fuf_modesDisable = [ 'mrucmd' ]
let g:fuf_previewHeight = 0
let g:fuf_keyOpenSplit = '<A-2>'
let g:fuf_keyOpenVsplit = '<A-3>'

" XXX: the first line in the assignment
"      below was copied directly from
"      :help g:fuf_file_exclude@en
let g:fuf_mrufile_exclude =
      \ '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
      \ . '|^/tmp/|^/var/tmp/|^\~/tmp/'
      \ . '|\.git'

nnoremap <Leader>o :FufFile<Enter>
nnoremap <Leader>O :FufMruFile<Enter>

" file system browser
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>F :NERDTreeFind<Enter>

"-----------------------------------------------------------------------------
" buffers
"-----------------------------------------------------------------------------

nnoremap <C-PageUp> :bprev<Enter>
nnoremap <C-PageDown> :bnext<Enter>
nnoremap <A-6> :FufBuffer<Enter>
nnoremap <Leader>4 :bdelete<Enter>
nnoremap <Leader>l :checktime<Enter>
nnoremap <Leader>w :write<Enter>
nnoremap <Leader>W :saveas<Space>

"-----------------------------------------------------------------------------
" splits
"-----------------------------------------------------------------------------

nnoremap <A-PageUp> <C-W>W
nnoremap <A-PageDown> <C-W>w
nnoremap <A-1> <C-W>o
nnoremap <A-2> :rightbelow split<Enter>
nnoremap <A-3> :rightbelow vsplit<Enter>
nnoremap <A-4> <C-W>c
nnoremap <A-5> <C-W>=
nnoremap <A-7> <C-W>_
nnoremap <A-8> <C-W>1_
nnoremap <A-9> <C-W><Bar>
nnoremap <A-0> <C-W>1<Bar>

"-----------------------------------------------------------------------------
" folds
"-----------------------------------------------------------------------------

" go to adjacent folds
nnoremap <C-Up> zk
nnoremap <C-Down> zj

" open and close folds
nnoremap <A-Down> zo
nnoremap <A-S-Down> zO
nnoremap <A-Up> zc
nnoremap <A-S-Up> zM zv zc

" change the foldlevel
nnoremap <A-Left> zm
nnoremap <A-S-Left> zM
nnoremap <A-Right> zr
nnoremap <A-S-Right> zR

"-----------------------------------------------------------------------------
" narrow
"-----------------------------------------------------------------------------

vnoremap <Leader>n :Narrow<Enter>
nnoremap <Leader>N :Widen<Enter>

"-----------------------------------------------------------------------------
" gundo
"-----------------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<Enter>

"-----------------------------------------------------------------------------
" rails
"-----------------------------------------------------------------------------

nnoremap <Leader>r :R
nnoremap <Leader>R :A
nnoremap <Leader>h :A<Enter>
nnoremap <Leader>H :R<Enter>

"-----------------------------------------------------------------------------
" syntastic
"-----------------------------------------------------------------------------

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1
let g:syntastic_disabled_filetypes=['haml', 'sass']

"-----------------------------------------------------------------------------
" fugitive
"-----------------------------------------------------------------------------

nnoremap <Leader>gb :Gblame<Enter>
nnoremap <Leader>gc :Gcommit<Enter>
nnoremap <Leader>gd :Gdiff<Enter>
nnoremap <Leader>ge :Gedit<Enter>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>g. :Gcd<Enter>
nnoremap <Leader>gl :Extradite<Enter>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gr :Gread<Enter>
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gw :Gwrite<Enter>
nnoremap <Leader>gx :Gremove<Enter>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
