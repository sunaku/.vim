if &term == 'linux'
  colorscheme desert
" elseif has('gui_running') || has('nvim')
      " \ && exists('$NVIM_TUI_ENABLE_TRUE_COLOR')
      " \ && $NVIM_TUI_ENABLE_TRUE_COLOR == 1
  " colorscheme yowish
else
  colorscheme gruvbox
  " colorscheme bubblegum-256-dark
  " colorscheme lucius361
endif
