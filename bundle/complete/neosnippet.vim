" Plugin key-mappings.
imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)
xmap <C-S-j> <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><Tab> neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)"
      \: "\<Plug>vim_completes_me_forward"
smap <expr><Tab> neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)"
      \: "\<Plug>vim_completes_me_forward"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
