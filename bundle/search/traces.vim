Shortcut (traces) interactive search and replace in selection or buffer
      \ nnoremap <Space>c/ :%s/
      \|vnoremap <Space>c/ :s/

Shortcut (traces) interactive search and replace for word at cursor
      \ nnoremap <silent> <Space>c* :call feedkeys(':%s/'.escape(expand('<cword>'), '/').'/', 'n')<CR>
      \|vnoremap <silent> <Space>c* y:call feedkeys(':%s/'.escape(getreg(0), '/').'/', 'n')<CR>
