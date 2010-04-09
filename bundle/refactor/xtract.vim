Shortcut (Xtract) extract selection into relative file
      \ nnoremap <silent> <Space>cF :call feedkeys(':Xtract '.expand('%'), 't')<CR>
      \|vnoremap <silent> <Space>cF :<C-U>call feedkeys(":'<,'>Xtract ".expand('%'), 't')<CR>

