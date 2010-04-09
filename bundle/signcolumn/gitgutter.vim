let g:gitgutter_map_keys = 0

Shortcut! vag (textobj) select around git hunk
Shortcut! vig (textobj) select inside git hunk

omap ig <Plug>GitGutterTextObjectInnerPending
omap ag <Plug>GitGutterTextObjectOuterPending
xmap ig <Plug>GitGutterTextObjectInnerVisual
xmap ag <Plug>GitGutterTextObjectOuterVisual

Shortcut (GitGutter) jump to previous git hunk
      \ nmap [g <Plug>GitGutterPrevHunk

Shortcut (GitGutter) jump to next git hunk
      \ nmap ]g <Plug>GitGutterNextHunk

Shortcut (GitGutter) stage git hunk at cursor
      \ nmap <Space>ig <Plug>GitGutterStageHunk

Shortcut (GitGutter) revert git hunk at cursor
      \ nmap <Space>ug <Plug>GitGutterUndoHunk

Shortcut (GitGutter) preview git hunk at cursor
      \ nmap <Space>Hg <Plug>GitGutterPreviewHunk

Shortcut (GitGutter) toggle git hunk signs
      \ nnoremap <silent> <Space>tg :GitGutterToggle<CR>

Shortcut (GitGutter) toggle git hunk highlighting
      \ nnoremap <silent> <Space>tG :GitGutterLineHighlightsToggle<CR>
