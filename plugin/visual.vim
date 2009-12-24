" allow virtual editing in visual block mode
set virtualedit+=block

" visually select most recently pasted text
nnoremap gV `[v`]

" emulate nearest search selection in old Vim
if v:version < 704
  nnoremap gn //e<CR>v??<CR>
  nnoremap gN ??e<CR>v??<CR>
endif
