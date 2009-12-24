set hlsearch   " highlight search results
set ignorecase " make searching case insensitive
set smartcase  " ... unless the query has capital letters

" make <C-L> (redraw screen) also turn off
" search highlighting until the next search
" http://vim.wikia.com/wiki/Example_vimrc
nnoremap <C-L> :nohlsearch<Return><C-L>

" list all occurrences of word under cursor in current buffer
nnoremap <Leader>* [I

" find merge conflict markers
nnoremap <Leader>! /\v^[<=>]{7}( <Bar>$)/<Return>
