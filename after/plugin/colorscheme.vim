if &term == 'linux' || $TERM == 'linux'
  colorscheme desert
elseif &background == 'light'
  colorscheme PaperColor
  " let g:solarized_statusline = 'flat'
  " colorscheme solarized8
else
  colorscheme gruvbox-material
  " colorscheme everforest
endif
