set nobackup writebackup                 " backup only while writing
set undofile undodir=$HOME/.vim-undo//   " store all undo files here
set swapfile directory=$HOME/.vim-swap// " store all swap files here
if !isdirectory(&undodir)   | call mkdir(&undodir,   'p', 0700) | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p', 0700) | endif

" remove trailing spaces before saving text files
" http://vim.wikia.com/wiki/Remove_trailing_spaces
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    let l:cursor = winsaveview()
    if &filetype == 'mail'
      " preserve space after e-mail signature separator
      silent g/\(^--\)\@<!\s\+$/s///
    else
      silent g/\s\+$/s///
    endif
    call winrestview(l:cursor)
  endif
endfunction
