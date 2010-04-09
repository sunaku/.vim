if &background == 'dark'
  finish
endif

" warmer dimmer background
highlight Normal guibg=#e5e5e5
highlight LineNr guibg=#e5e5e5
highlight NonText guibg=#e5e5e5
highlight VertSplit guifg=#e5e5e5
highlight SignColumn guibg=#e5e5e5

" highlight CursorLineNr guibg=#dedede
" highlight! link CursorLineNr TabLine
" highlight CursorLineNr guibg=#ebebe6
" highlight CursorLineNr guibg=#eeeeee

" FZF integration
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Number'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
