set foldenable
set foldmethod=indent " indentation defines folds
set foldlevelstart=99 " close folds below this depth, initially

" go to adjacent folds
nnoremap <C-Up> zk
nnoremap <C-Down> zj
nnoremap <C-Left> [[
nnoremap <C-Right> ]]

" open and close folds
nnoremap <A-Down> zo
nnoremap <A-S-Down> zO
nnoremap <A-Up> zc
nnoremap <A-S-Up> zM zv

" change the foldlevel
nnoremap <A-Left> zm
nnoremap <A-S-Left> zM
nnoremap <A-Right> zr
nnoremap <A-S-Right> zR
