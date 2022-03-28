set nobackup writebackup                 " backup only while writing
set undofile undodir=$HOME/.vim-undo//   " store all undo files here
set swapfile directory=$HOME/.vim-swap// " store all swap files here
if !isdirectory(&undodir)   | call mkdir(&undodir,   'p', 0700) | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p', 0700) | endif

Shortcut edit file as...
      \ nnoremap <silent> <Space>Ef :call feedkeys(':edit '.expand('%'), 't')<CR>

Shortcut save file as...
      \ nnoremap <silent> <Space>yf :call feedkeys(':saveas '.expand('%'), 't')<CR>

Shortcut save copy of file as...
      \ nnoremap <silent> <Space>Yf :call feedkeys(':write '.expand('%'), 't')<CR>
