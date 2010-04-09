" Search API docs for query you type in:
nnoremap <Leader>k :Dasht<Space>

" Search API docs for word under cursor:
nnoremap <silent> <Leader>K :call Dasht([expand('<cWORD>'), expand('<cword>')])<Return>

" Search API docs for the selected text:
vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>

" Specify additional API docs to search:
" (maps filetype name to docset regexps)
let g:dasht_filetype_docsets = {
      \ 'elixir': ['erlang'],
      \ 'html': ['css', 'js'],
      \ }

" Search API docs for query you type in:
nnoremap <Leader><Leader>k :Dasht!<Space>

" Search API docs for word under cursor:
nnoremap <silent> <Leader><Leader>K :call Dasht([expand('<cWORD>'), expand('<cword>')], '!')<Return>

" Search API docs for the selected text:
vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>
