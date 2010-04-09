Shortcut (projectionist) expose alternate file
      \ nnoremap <silent> <Space>ea :A<CR>

Shortcut (projectionist) create file relative to innermost root
      \ nnoremap <silent> <Space>if :call feedkeys(':A ', 't')<CR>

Shortcut (projectionist) replace buffer with "new file" template
      \ nnoremap <silent> <Space>rB :AD<CR>

Shortcut (projectionist) change working directory to innermost root
      \ nnoremap <silent> <Space>id :Pcd<CR>

Shortcut (projectionist) change buffer's working directory to innermost root
      \ nnoremap <silent> <Space>iD :Plcd<CR>

Shortcut (projectionist) expose available projections
      \ nnoremap <silent> <Space>eA :call feedkeys(":Commands\n open_projections\<C-A>", 'n')<CR>

" load heuristics (which also specify projections) from relative directory
let files = glob(expand('<sfile>:r').'.heuristics/*.json', v:false, v:true)
let jsons = map(files, 'json_decode(join(readfile(v:val)))')
let merged = {} | call map(jsons, 'extend(merged, v:val)')
silent! unlet merged['_'] " strip makeshift 'comment' keys
let g:projectionist_heuristics = merged
