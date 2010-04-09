if &term == 'linux' || $TERM == 'linux'
  colorscheme desert
elseif &background == 'light'
  let g:solarized_statusline = 'flat'
  " colorscheme solarized8
  colorscheme PaperColor
else
  " colorscheme gruvbox-material
  colorscheme everforest
  set cursorline
endif
