set foldenable
set foldmethod=indent " indentation defines folds
set foldlevelstart=99 " close folds below this depth, initially

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
"
"         -- http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
"
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
