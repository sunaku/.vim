set hidden " lets you switch buffers without saving

" switch to adjacent buffer in current window
nnoremap <C-PageUp> :bprev<Return>
nnoremap <C-PageDown> :bnext<Return>

" close current buffer while retaining window
nnoremap <Leader>$ :execute 'bnext<Bar>bdelete' bufnr('%')<Return>

" reload current buffer while discarding changes
nnoremap <Leader>7 :edit!<Return>
