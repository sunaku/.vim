Shortcut (Xtract) extract selection into relative file
      \ nnoremap <silent> <Space>xf :call feedkeys(':Xtract '.expand('%'), 't')<CR>
      \|vnoremap <silent> <Space>xf :<C-U>call feedkeys(":'<,'>Xtract ".expand('%'), 't')<CR>

