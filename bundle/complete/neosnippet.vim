" Plugin key-mappings.
imap <C-J> <Plug>(neosnippet_expand_or_jump)
smap <C-J> <Plug>(neosnippet_expand_or_jump)
xmap <C-J> <Plug>(neosnippet_expand_target)
xmap <C-S-J> <Plug>(neosnippet_start_unite_snippet_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
