let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#always_use_completeopt = 1
let g:mucomplete#cycle_all = 1
let g:mucomplete#no_mappings = 1 " avoid <C-H> conflict with lexima

" cycle through completion menu
imap <tab> <Plug>(MUcompleteFwd)

" cycle through completion chains when the menu is already visible
inoremap <silent> <plug>(MUcompleteFwdKey) <s-tab>
imap <s-tab> <plug>(MUcompleteCycFwd)

" manually force-trigger completion when automatic completion fails
inoremap <C-L> <Esc>a<C-N>

" completion engines
let g:mucomplete#chains = {'default': []}
let g:mucomplete#can_complete = {'default': {}}
let g:mucomplete#user_mappings = {}
let g:mucomplete#chains.default = ['keyn', 'neosnippet', 'dict', 'uspl', 'path', 'omni']

" Unite integration
autocmd FileType unite MUcompleteAutoOff

" Neosnippet integration
" https://github.com/lifepillar/vim-mucomplete/issues/71
let g:mucomplete#can_complete.default.neosnippet = {
      \ t -> get(g:, 'loaded_neosnippet', 0) &&
      \ (g:mucomplete_with_key || t =~# '\m\k\k$') }
let g:mucomplete#user_mappings.neosnippet = "\<c-r>=MUcompleteNeosnippet()\<cr>"
function! MUcompleteNeosnippet()
  let l:snippets = neosnippet#helpers#get_snippets()
  if !empty(l:snippets)
    let l:pat = matchstr(getline('.'), '\S\+\%'.col('.').'c')
    let l:candidates = map(filter(keys(l:snippets), 'stridx(v:val,l:pat)==0'),
          \  '{
          \      "word": v:val,
          \      "menu": "[snip] ". get(l:snippets[v:val], "description", ""),
          \      "dup" : 1
          \   }')
    if !empty(l:candidates)
      call complete(col('.') - len(l:pat), l:candidates)
    endif
  endif
  return ''
endfunction
