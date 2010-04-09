" Deoplete requires NeoVim
if ! has('nvim')
  finish
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Plugin key-mappings.
inoremap <expr><C-u> deoplete#mappings#undo_completion()
" inoremap <expr><C-e> neocomplete#complete_common_string()

" <TAB>: completion.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ deoplete#mappings#manual_complete()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <C-g>: cancel.
" inoremap <expr><C-g> neocomplete#cancel_popup()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction
