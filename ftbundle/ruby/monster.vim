" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" Use neocomplete.vim
let g:neocomplete#sources#omni#input_patterns = {
\   'ruby' : '[^. *\t]\.\w*\|\h\w*::',
\}
