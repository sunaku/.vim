set nobackup writebackup        " backup only while writing
set undodir=$HOME/.vim-undo//   " store all undo files here
set directory=$HOME/.vim-swap// " store all swap files here

if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

if !isdirectory(&directory)
  call mkdir(&directory, 'p', 0700)
endif
