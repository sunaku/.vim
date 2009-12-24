" My custom tabline that shows tab numbers for easy jumping to tab with [N]gt
" and also highlights tab names that contain unsaved changes (dirty buffers).
" See :help setting-tabline and :help 'guitablabel' and :help highlight-groups

set tabline=%!MyTabLine()

function! MyTabLine() abort
  let s = ''
  for i in range(tabpagenr('$'))
    let n = i + 1

    " set the tab page number (for mouse clicks)
    let s .= '%' . n . 'T'

    " the label is made by MyTabLabel()
    let s .= MyTabLabel(n)
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X[X]'
  endif

  return s
endfunction

function! MyTabLabel(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let active = tabpagenr() == a:n

  " add '+' if one of the buffers in the tab page is modified
  let dirty = 0
  for bufnr in buflist
    if getbufvar(bufnr, "&modified")
      let dirty = 1
      break
    endif
  endfor

  " set highlighting for tab number, adding dirty indicator
  if dirty
    let tab_number = '%#PmenuSbar#'. a:n .'+'
  else
    let tab_number = '%#TabLineSel#'. a:n
  endif

  " set highlighting for tab label according to active/dirty
  if active
    let fname_style = '%#CursorLineNr#'
  elseif dirty
    let fname_style = '%#PmenuSbar#'
  else
    let fname_style = '%#TabLine#'
  endif

  " only show the filename, stripping off its preceding path
  let fname = bufname(buflist[winnr - 1])
  let fname = fnamemodify(fname, ':t')
  if empty(fname) | let fname = '[No Name]' | endif

  return ' '. tab_number . fname_style . fname
endfunction
