let g:cursorword_highlight = 0

augroup cursorword_highlight
  autocmd!
  autocmd ColorScheme * call s:after_colorsheme_loaded()
augroup END

function! s:after_colorsheme_loaded() abort
  " also make it bold (the default is only to underline)
  highlight CursorWord term=bold,underline cterm=bold,underline gui=bold,underline
endfunction
