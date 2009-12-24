set scrolloff=3 " context lines around cursor

" retain relative cursor position when paging
nnoremap <PageUp> <C-U>
nnoremap <PageDown> <C-D>

" store relative line number jumps in jumplist
" while treating wrapped lines like real lines
" NOTE: m' stores current position in jumplist
" NOTE: thanks to osse and bairui in #vim IRC!
nnoremap <silent> k :<C-U>execute 'normal!' (v:count>1 ? "m'".v:count.'k' : 'gk')<Return>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count>1 ? "m'".v:count.'j' : 'gj')<Return>

" apply these tricks to up and down arrow keys
nmap <Up> k
nmap <Down> j
