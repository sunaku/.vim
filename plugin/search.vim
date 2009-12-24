set incsearch  " do incremental searching
set hlsearch   " highlight search results
set ignorecase " make searching case insensitive
set smartcase  " ... unless the query has capital letters

" minus repeats fFtT search forward
noremap - ;

" underscore repeats fFtT search backward
noremap _ ,

" make <C-l> (redraw screen) also turn off
" search highlighting until the next search
" http://vim.wikia.com/wiki/Example_vimrc
nnoremap <silent> <C-l> :nohlsearch<Return><C-l>

" find merge conflict markers
nnoremap <Leader>c/ /^[<=>]\{7\}\( \<Bar>$\)/<Return>
