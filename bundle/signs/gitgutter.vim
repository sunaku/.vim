let g:gitgutter_map_keys = 0

Shortcut! vah (textobj) select around git hunk
Shortcut! vih (textobj) select inside git hunk

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

Shortcut (GitGutter) jump to previous git hunk
      \ nmap [h <Plug>(GitGutterPrevHunk)

Shortcut (GitGutter) jump to next git hunk
      \ nmap ]h <Plug>(GitGutterNextHunk)

Shortcut (GitGutter) stage git hunk at cursor
      \ nmap <Space>wh <Plug>(GitGutterStageHunk)

Shortcut (GitGutter) revert git hunk at cursor
      \ nmap <Space>rh <Plug>(GitGutterUndoHunk)

Shortcut (GitGutter) preview git hunk at cursor
      \ nmap <Space>gh <Plug>(GitGutterPreviewHunk)

Shortcut (GitGutter) toggle git hunk signs
      \ nnoremap <silent> <Space>th :GitGutterToggle<CR>

Shortcut (GitGutter) toggle git hunk highlighting
      \ nnoremap <silent> <Space>tH :GitGutterLineHighlightsToggle<CR>
