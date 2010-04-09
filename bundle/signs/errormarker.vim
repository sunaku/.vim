let errormarker_disablemappings = 1

Shortcut (errormarker) expose error message for cursor position
      \ nnoremap <silent> <Space>eE :ErrorAtCursor<CR>

Shortcut (errormarker) remove all error markers from signcolumn
      \ nnoremap <silent> <Space>dE :RemoveErrorMarkers<CR>
