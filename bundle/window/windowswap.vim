let g:windowswap_map_keys = 0

Shortcut (windowswap) yank window
      \ nnoremap <silent> <Space>yw :call WindowSwap#MarkWindowSwap()<CR>

Shortcut (windowswap) paste window
      \ nnoremap <silent> <Space>pw :call WindowSwap#DoWindowSwap()<CR>
