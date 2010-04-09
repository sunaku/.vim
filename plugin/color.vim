" enable support for 24-bit true color palette in colorschemes
if has('termguicolors') && has('nvim') && $TERM != 'linux'
  set termguicolors
endif

" terminals that I typically use have a dark background color
try
  let &background=readfile(expand('~/.themes/background'))[0]
catch
  set background=dark
endtry

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
