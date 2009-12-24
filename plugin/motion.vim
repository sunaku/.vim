" retain relative cursor position when paging
nnoremap <PageUp> <C-U>
nnoremap <PageDown> <C-D>

" store relative line number jumps in jumplist
" while treating wrapped lines like real lines
" but don't do this if going up/down by 1 line
" NOTE: m' stores current position in jumplist
" NOTE: thanks to osse and bairui in #vim IRC!
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count . 'k' : 'gk')<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count . 'j' : 'gj')<CR>
nmap <Up> k
nmap <Down> j

" provide original functionality on the g-keys
nnoremap gk k
nnoremap gj j
nnoremap g<Up> k
nnoremap g<Down> j
