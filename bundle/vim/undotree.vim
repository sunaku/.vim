let g:undotree_SetFocusWhenToggle = 1

Shortcut (undotree) toggle undo history tree sidebar
      \ nnoremap <silent> <Space>tu :UndotreeToggle<CR>

augroup undotree_my_settings
  autocmd!
  autocmd FileType undotree setlocal number relativenumber
  autocmd FileType undotree vertical resize +4
augroup END
