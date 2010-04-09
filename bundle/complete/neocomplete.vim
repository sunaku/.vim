" NeoComplete doesn't work in NeoVim!
" We will use Deoplete there instead.
if has('nvim')
  finish
endif

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Insert delimiter after completion.
let g:neocomplete#enable_auto_delimiter = 1

" User must pause before completions are shown.
" https://www.reddit.com/r/vim/comments/2xl33m
let g:neocomplete#enable_cursor_hold_i = 1

" override rails.vim's setting of completefunc
" https://github.com/tpope/vim-rails/issues/283
let g:neocomplete#force_overwrite_completefunc = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-u> neocomplete#undo_completion()
inoremap <expr><C-e> neocomplete#complete_common_string()

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" <C-g>: cancel.
inoremap <expr><C-g> neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
