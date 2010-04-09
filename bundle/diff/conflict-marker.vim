let g:conflict_marker_enable_mappings = 0

Shortcut (conflict-marker) resolve merge conflict by keeping their version
      \ nnoremap <silent> <Space>ht :ConflictMarkerThemselves<CR>

Shortcut (conflict-marker) resolve merge conflict by keeping our version
      \ nnoremap <silent> <Space>ho :ConflictMarkerOurselves<CR>

Shortcut (conflict-marker) resolve merge conflict by keeping both versions
      \ nnoremap <silent> <Space>hc :ConflictMarkerBoth<CR>

Shortcut (conflict-marker) resolve merge conflict by deleting both versions
      \ nnoremap <silent> <Space>hn :ConflictMarkerNone<CR>
