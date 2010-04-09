" make TODO keywords stand out
highlight! link Todo WarningMsg

" make spelling errors stand out
if !has('gui_running')
  highlight! link SpellBad   Pmenu
  highlight! link SpellCap   PmenuSbar
  highlight! link SpellLocal PmenuThumb
  highlight! link SpellRare  WildMenu
endif

" make comments brighter
" highlight Comment ctermfg=102 guifg=#878787
" highlight Comment ctermfg=145 guifg=#afafaf
highlight Comment ctermfg=245

" add LimeLight support for gruvbox
let g:limelight_conceal_ctermfg = 241

" improve unite.vim search candidate highlighting
highlight link uniteCandidateInputKeyword MoreMsg
