let g:highlightedyank_highlight_duration = 300
highlight link HighlightedyankRegion DiffAdd

if !has('nvim') " it's automatic under NeoVim
  map y <Plug>(highlightedyank)
endif
