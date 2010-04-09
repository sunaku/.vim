let g:scratch_no_mappings = 1
let g:scratch_persistence_file = &undodir . '/scratch.txt'

Shortcut (scratch) expose scratch buffer
      \ nnoremap <silent> <Space>ex :Scratch<CR>

Shortcut (scratch) toggle scratch buffer preview
      \ nnoremap <silent> <Space>tx :ScratchPreview<CR>

Shortcut! <Space>ix (scratch) enter insert mode in scratch buffer
Shortcut! <Space>Ix (scratch) clear scratch buffer and enter insert mode in it
Shortcut! <Space>yx (scratch) yank selection to scratch buffer
Shortcut! <Space>Yx (scratch) clear scratch buffer and yank selection to it

nmap <Space>ix <plug>(scratch-insert-reuse)
nmap <Space>Ix <plug>(scratch-insert-clear)
xmap <Space>yx <plug>(scratch-selection-reuse)
xmap <Space>Yx <plug>(scratch-selection-clear)
