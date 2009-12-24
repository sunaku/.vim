set nobackup writebackup        " backup only while writing
set undodir=$HOME/.vim-undo//   " store all undo files here
set directory=$HOME/.vim-swap// " store all swap files here
if !isdirectory(&undodir)   | call mkdir(&undodir,   'p') | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p') | endif

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

nnoremap <silent> <Leader><C-s> :call StripTrailingWhitespace()<Return>
nnoremap <silent> <C-s> :write<Return>
" nnoremap <silent> <C-S-s> :saveas<Space>
