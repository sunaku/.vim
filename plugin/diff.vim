Shortcut diff obtain hunk from left window
      \ nnoremap <silent> <Space>h, :diffget //2<Bar>diffupdate<CR>

Shortcut diff obtain hunk from right window
      \ nnoremap <silent> <Space>h. :diffget //3<Bar>diffupdate<CR>

Shortcut diff buffer against original version
      \ nnoremap <silent> <Space>hb :DiffOrig<CR>

Shortcut diff put hunk into left window
      \ nnoremap <silent> <Space>h< :diffput //2<Bar>diffupdate<CR>

Shortcut diff put hunk into right window
      \ nnoremap <silent> <Space>h> :diffput //3<Bar>diffupdate<CR>
