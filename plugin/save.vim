set nobackup writebackup                 " backup only while writing
set undofile undodir=$HOME/.vim-undo//   " store all undo files here
set swapfile directory=$HOME/.vim-swap// " store all swap files here

" Vim and NeoVim have incompatible undo files, so use different dirs
let vim = fnamemodify($VIM, ':t')
execute 'set undodir='.substitute(&undodir, '/\.\zsvim\ze-', vim, '')

" create undo and swap directories as necessary
if !isdirectory(&undodir)   | call mkdir(&undodir,   'p', 0700) | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p', 0700) | endif

Shortcut edit file as...
      \ nnoremap <silent> <Space>eF :call feedkeys(':edit '.expand('%'), 't')<CR>

Shortcut save file as...
      \ nnoremap <silent> <Space>yf :call feedkeys(':saveas '.expand('%'), 't')<CR>

Shortcut save copy of file as...
      \ nnoremap <silent> <Space>yF :call feedkeys(':write '.expand('%'), 't')<CR>
