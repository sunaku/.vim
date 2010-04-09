" initial setup
if !exists('g:zenburn_high_Contrast')
  let g:zenburn_old_Visual=1
  let g:zenburn_high_Contrast=1
endif

" overrides
if exists('g:colors_name')
  if g:zenburn_high_Contrast
    " disable bold for current line in graphical Vim
    highlight CursorLine gui=none

    " make highlight for current line more visible
    highlight! link CursorLine CursorColumn
  endif

  " brighten comments (SpecialKey) and disable italics
  highlight Comment guifg=#9ece9e ctermfg=151 gui=none

  " darken listchars
  highlight! link SpecialKey NonText

  " text width limit
  highlight! link ColorColumn StatusLineNC
endif
