" delegate colorscheme configuration to config/color/<colorscheme>.vim files
autocmd ColorScheme * execute 'runtime config/color/'. g:colors_name .'.vim'

" highlight the maximum textwidth limit using a colored column
set colorcolumn=+1
autocmd ColorScheme * highlight! link ColorColumn CursorColumn

" terminals that I typically use have a dark background color
set background=dark

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has('gui_running')
  colorscheme base16-tomorrow
else
  colorscheme lucius
endif
