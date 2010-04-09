if !exists('g:lucius_contrast_bg') || g:lucius_contrast_bg == 'normal'
  if &background == 'dark'
    " brighten comments
    "highlight Comment ctermfg=102 guifg=#878787
    "highlight Comment ctermfg=108 guifg=#87af87
    highlight Comment ctermfg=109 guifg=#87afaf
    "highlight Comment ctermfg=138 guifg=#af8787
    "highlight Comment ctermfg=145 guifg=#afafaf
    "highlight Comment ctermfg=181 guifg=#dfafaf
    "highlight Comment ctermfg=245 guifg=#8a8a8a
    "highlight Comment cterm=bold

    " brighten search matches
    highlight! link Search DiffText

    " brighten line numbers
    highlight LineNr ctermfg=102 guifg=#878787
    "highlight! link CursorLineNr PmenuSel
    highlight! link CursorLineNr Title
    "highlight CursorLineNr cterm=reverse,bold

    " blend splits with line number gutter
    highlight! link VertSplit SignColumn

    " darken status lines
    "highlight StatusLineNC cterm=reverse gui=reverse
    "highlight! link StatusLineNC LineNr
    highlight StatusLineNC ctermfg=247 ctermbg=237
    highlight StatusLine ctermbg=102 guibg=#878787

    " darken matching parenthesis
    highlight! link MatchParen SignColumn

  else " light background

    " inherit XTerm's background color by not setting any background color
    " (there is no 256-color equivalent for this, so we have to inherit it)
    highlight Normal ctermbg=none guibg=#ebebe6

    " Airline support for lucius
    let g:airline_theme='sol'

  endif
endif
