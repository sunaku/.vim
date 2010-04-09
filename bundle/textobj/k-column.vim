" avoid mapping conflict with vim-textobj-comment and vim-movar plugins
" https://github.com/glts/vim-textobj-comment/issues/1
let g:skip_default_textobj_word_column_mappings = 1
xnoremap <silent> ak :<C-u>call TextObjWordBasedColumn("aw")<CR>
onoremap <silent> ak :call TextObjWordBasedColumn("aw")<CR>
xnoremap <silent> ik :<C-u>call TextObjWordBasedColumn("iw")<CR>
onoremap <silent> ik :call TextObjWordBasedColumn("iw")<CR>
xnoremap <silent> aK :<C-u>call TextObjWordBasedColumn("aW")<CR>
onoremap <silent> aK :call TextObjWordBasedColumn("aW")<CR>
xnoremap <silent> iK :<C-u>call TextObjWordBasedColumn("iW")<CR>
onoremap <silent> iK :call TextObjWordBasedColumn("iW")<CR>
