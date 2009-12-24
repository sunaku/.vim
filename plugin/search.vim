set incsearch  " do incremental searching
set hlsearch   " highlight search results
set ignorecase " make searching case insensitive
set smartcase  " ... unless the query has capital letters

" make <C-L> (redraw screen) also turn off
" search highlighting until the next search
" and also redraw any pending diff updates
" https://github.com/tpope/vim-sensible
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" " consistent direction of search repetition: n down, N up
" " https://www.reddit.com/r/vim/comments/7l5pei/_/drkjo5h/
" nnoremap <expr> n 'Nn'[v:searchforward]
" nnoremap <expr> N 'nN'[v:searchforward]
