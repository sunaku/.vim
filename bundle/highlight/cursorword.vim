let g:cursorword_highlight = 0

augroup cursorword_highlight
  autocmd!
  autocmd ColorScheme * call s:after_colorsheme_loaded()
augroup END

function! s:after_colorsheme_loaded() abort
  " also make it bold (default is only to underline)
  highlight CursorWord0 term=bold,underline cterm=bold,underline gui=bold,underline
  highlight link CursorWord1 CursorWord0
endfunction
