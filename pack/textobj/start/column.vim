let g:skip_default_textobj_word_column_mappings = 1

Shortcut! vak (textobj) select around vertical word column
Shortcut! vik (textobj) select inside vertical word column

Shortcut! vaK (textobj) select around vertical WORD column
Shortcut! viK (textobj) select inside vertical WORD column

xnoremap <silent> ak :<C-u>call TextObjWordBasedColumn("aw")<cr>
xnoremap <silent> aK :<C-u>call TextObjWordBasedColumn("aW")<cr>
xnoremap <silent> ik :<C-u>call TextObjWordBasedColumn("iw")<cr>
xnoremap <silent> iK :<C-u>call TextObjWordBasedColumn("iW")<cr>
onoremap <silent> ak :call TextObjWordBasedColumn("aw")<cr>
onoremap <silent> aK :call TextObjWordBasedColumn("aW")<cr>
onoremap <silent> ik :call TextObjWordBasedColumn("iw")<cr>
onoremap <silent> iK :call TextObjWordBasedColumn("iW")<cr>
