set incsearch  " do incremental searching
set hlsearch   " highlight search results
set ignorecase " make searching case insensitive
set smartcase  " ... unless the query has capital letters

" make <C-L> (redraw screen) also turn off
" search highlighting until the next search
" and also redraw any pending diff updates
" https://github.com/tpope/vim-sensible
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
