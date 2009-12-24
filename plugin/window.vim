set splitright " focus new window after vertical splitting
set splitbelow " focus new window after horizontal splitting

" focus adjacent window
nnoremap <A-PageUp> <C-w>W
nnoremap <A-PageDown> <C-w>w

" collapse other windows
nnoremap <Leader>1 <C-w><Bar><C-w>_

" close other windows
nnoremap <Leader>! <C-w>o

" split current window
nnoremap <Leader>2 <C-w>s
nnoremap <Leader>3 <C-w>v

" close current window
nnoremap <Leader>4 <C-w>c

" all windows equal size
nnoremap <Leader>0 <C-w>=
" ... also on vim resize
"autocmd VimResized * execute "normal \<C-w>=\<C-l>"
