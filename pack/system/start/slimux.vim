let g:slimux_enable_close_with_esc = 0 " else arrow keys close it

Shortcut (slimux) select target pane interactively
      \ nnoremap <silent> <Space>ox :SlimuxREPLConfigure<CR>

Shortcut (slimux) send entire buffer to target pane
      \ nnoremap <silent> <Space>Wx :SlimuxREPLSendBuffer<CR>

Shortcut (slimux) send line or selection to target pane
      \ nnoremap <silent> <Space>wx :SlimuxREPLSendLine<CR>
      \|vnoremap <silent> <Space>wx :SlimuxREPLSendSelection<CR>
