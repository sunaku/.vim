call shortcut#map('<Space> K', 'Search -> API docs (with dasht)')
function! Shortcut_search_api_docs_with_dasht() abort
  if shortcut#mode() == 'n'
    call Dasht([expand('<cWORD>'), expand('<cword>')])
  else
    normal! y
    call Dasht(getreg(0))
    " FIXME: need to wait until original buffer is focused again
    if !has('nvim')
      normal! gv
    endif
  endif
endfunction
