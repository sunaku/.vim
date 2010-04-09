if exists('g:colors_name')
  " default to dark theme
  if !exists('g:lucius_style')
    LuciusDark
  endif

  if g:lucius_style == 'dark'
    " brighten comments
    highlight Comment ctermfg=248 guifg=#a8a8a8

    " brighten line numbers
    highlight LineNr ctermfg=246 guifg=#949494
    highlight! link CursorLineNr Folded

    " darken status lines
    highlight! link VertSplit LineNr
    highlight! link StatusLineNC PmenuThumb

    " brighten search matches
    highlight! link Search DiffText
  endif
endif
