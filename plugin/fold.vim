set foldenable
set foldmethod=indent " indentation defines folds
set foldlevelstart=99 " close folds below this depth, initially

" go to adjacent folds
nnoremap <C-Up> zk
nnoremap <C-S-Up> [[
nnoremap <C-Down> zj
nnoremap <C-S-Down> ]]

" open and close folds
nnoremap <A-Down> zo
nnoremap <A-S-Down> zO
nnoremap <A-Up> zc
nnoremap <A-S-Up> zC

" change the foldlevel
nnoremap <A-Left> zm
nnoremap <A-S-Left> zM
nnoremap <A-Right> zr
nnoremap <A-S-Right> zR

" close all folds and then open current fold just enough to reveal cursor
nnoremap <Leader>z zM zv

"-----------------------------------------------------------------------------
" from http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
"-----------------------------------------------------------------------------
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
