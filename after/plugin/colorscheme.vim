if &term == 'linux'
  colorscheme desert
elseif has('gui_running')
  set background=light
  colorscheme lucius
elseif &background == 'dark'
  colorscheme gruvbox
else
  colorscheme lucius
endif
