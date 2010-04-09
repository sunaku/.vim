call shortcut#map("<Space> ` b", 'Buffer -> Outline', 'Unite -no-split outline')
call shortcut#map("<Space> ' b", 'Buffer -> Jump to...', 'Unite -no-split buffer file/vcs file_mru')
call shortcut#map('<Space> : b', 'Buffer -> Each do...', 'call feedkeys(":bufdo ", "n")')
call shortcut#map('<Space> n b', 'Buffer -> Focus -> Next', 'bnext')
call shortcut#map('<Space> N b', 'Buffer -> Focus -> Previous', 'bprevious')
call shortcut#map('<Space> O b', 'Buffer -> Open -> Above', 'Window -> Split -> Above', 'Buffer -> Jump to...')
call shortcut#map('<Space> o b', 'Buffer -> Open -> Below', 'Window -> Split -> Below', 'Buffer -> Jump to...')
call shortcut#map('<Space> i b', 'Buffer -> Open -> Left', 'Window -> Split -> Left', 'Buffer -> Jump to...')
call shortcut#map('<Space> a b', 'Buffer -> Open -> Right', 'Window -> Split -> Right', 'Buffer -> Jump to...')
call shortcut#map('<Space> r b', 'Buffer -> Reload', 'confirm edit')
call shortcut#map('<Space> R b', 'Buffer -> Reload (force)', 'edit!')
call shortcut#map('<Space> w b', 'Buffer -> Save', 'write')
call shortcut#map('<Space> W b', 'Buffer -> Save (strip)', 'Buffer -> Strip trailing whitespace', 'Buffer -> Save')
call shortcut#map('<Space> y b', 'Yank -> Buffer', 'Visual -> Buffer', 'normal! y')
call shortcut#map('<Space> D b', 'Buffer -> Close -> All', '%bdelete')
call shortcut#map('<Space> d b', 'Buffer -> Close', 'Sayonara!')
call shortcut#map('<Space> d $', 'Buffer -> Strip trailing whitespace')
call shortcut#map('<C-s>', 'Buffer -> Save (strip)')

" call shortcut#map('<Space> d b', 'Buffer -> Close')
" function! Shortcut_buffer_close() abort
  " let buffer = bufnr('%')
  " bprevious
  " execute 'bdelete' buffer
" endfunction

function! Shortcut_buffer_strip_trailing_whitespace() abort
" http://vim.wikia.com/wiki/Remove_trailing_spaces
  if !&binary && &filetype != 'diff'
    let l:cursor = winsaveview()
    if &filetype == 'mail'
      " preserve space after e-mail signature separator
      silent g/\(^--\)\@<!\s\+$/s///
    else
      silent g/\s\+$/s///
    endif
    call winrestview(l:cursor)
  endif
endfunction
