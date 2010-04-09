" let g:clap_layout = { 'relative': 'editor' }

Shortcut (clap) expose yanks
      \ nnoremap <silent> <Space>ey :Clap yanks<CR>

Shortcut (clap) expose registers
      \ nnoremap <silent> <Space>er :Clap registers<CR>

Shortcut (clap) expose filer in working directory
      \ nnoremap <silent> <Space>od :Clap filer<CR>

Shortcut (clap) expose filer in buffer's directory
      \ nnoremap <silent> <Space>oD :call feedkeys(":Clap filer\n".expand('%:h').'/', 'n')<bar>call feedkeys("\t", 't')<CR>

" Shortcut (clap) open file under working directory
"       \ nnoremap <silent> <Space>of :Clap files<CR>

" Shortcut (clap) open git file (tracked by git)
"       \ nnoremap <silent> <Space>og :Clap git_files<CR>

" Shortcut (clap) open git file that has changes
"       \ nnoremap <silent> <Space>oG :Clap git_diff_files<CR>

" Shortcut (clap) open buffer
"       \ nnoremap <silent> <Space>ob :Clap buffers<CR>

Shortcut (clap) apply colorscheme
      \ nnoremap <silent> <Space>ec :Clap colors<CR>

Shortcut (clap) find line under working directory
      \ nnoremap <silent> <Space>/d :Clap grep2<CR>

" Shortcut (clap) expose line in any buffer
"       \ nnoremap <silent> <Space>eL :Clap lines<CR>

" Shortcut (clap) expose line in buffer
"       \ nnoremap <silent> <Space>el :Clap blines<CR>

Shortcut (clap) expose mark in buffer
      \ nnoremap <silent> <Space>em :Clap marks<CR>

Shortcut (clap) expose jumplist
      \ nnoremap <silent> <Space>ej :Clap jumps<CR>

" Shortcut (clap) expose window in any tab
"       \ nnoremap <silent> <Space>ew :Clap windows<CR>

" Shortcut (clap) reopen file from history
"       \ nnoremap <silent> <Space>o. :Clap history<CR>

" Shortcut (clap) repeat command from history
"       \ nnoremap <silent> <Space>e; :Clap hist:<CR>
"
" Shortcut (clap) repeat search from history
"       \ nnoremap <silent> <Space>e/ :Clap hist/<CR>

" Shortcut (clap) browse git log
"       \ nnoremap <silent> <Space>eg :Clap commits<CR>
"
" Shortcut (clap) browse git log for buffer
"       \ nnoremap <silent> <Space>eG :Clap bcommits<CR>

" Shortcut (clap) run command from menu
"       \ nnoremap <silent> <Space>e: :Clap command<CR>

" Shortcut (clap) trigger mapping / keybinding / shortcut
"       \ nnoremap <silent> <Space>e<Space> :Clap maps<CR>

" Shortcut (clap) open help topic
"       \ nnoremap <silent> <Space>oh :Clap help_tags<CR>

" Shortcut (clap) apply filetype
"       \ nnoremap <silent> <Space>eF :Clap filetypes<CR>

Shortcut (clap) expose location list
      \ nnoremap <silent> <Space>eQ :Clap loclist<CR>

Shortcut (clap) expose quickfix list
      \ nnoremap <silent> <Space>eq :Clap quickfix<CR>

Shortcut (clap) expose clap providers
      \ nnoremap <silent> <Space>ee :Clap providers<CR>
