set autoread " try to reload buffer changed on disk
set hidden " lets you switch buffers without saving
set nostartofline " preserves cursor when switching

" switch to adjacent buffer in current window
nnoremap <silent> <C-PageUp> :bprev<Return>
nnoremap <silent> <C-PageDown> :bnext<Return>

" close current buffer while retaining window
nnoremap <silent> <Leader>$ :execute 'bprevious<Bar>bdelete' bufnr('%')<Return>

" reload current buffer while discarding changes
nnoremap <silent> <Leader>7 :edit!<Return>
