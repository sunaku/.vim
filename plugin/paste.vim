Shortcut paste before cursor, adding an extra newline
      \ nnoremap <Space>PP O<Esc>P

Shortcut paste after cursor, adding an extra newline
      \ nnoremap <Space>pp o<Esc>p

Shortcut paste before cursor, surrounding with newlines
      \ nnoremap <Space>Pp O<Esc>O<Esc>p

Shortcut paste after cursor, surrounding with newlines
      \ nnoremap <Space>pP o<Esc>o<Esc>P

Shortcut paste before cursor, adding a space
      \ nnoremap <Leader>P i <Esc>P

Shortcut paste after cursor, adding a space
      \ nnoremap <Leader>p a <Esc>p

Shortcut enable verbatim paste mode
      \ nnoremap [op :set paste<CR>

Shortcut disable verbatim paste mode
      \ nnoremap ]op :set nopaste<CR>

Shortcut toggle verbatim paste mode
      \ nnoremap cop :set paste! paste?<CR>
