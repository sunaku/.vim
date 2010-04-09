" Reuse current window to show fzf menu
" let g:fzf_layout = { 'window': 'enew' }

" Use Vim8 popup or NeoVim floating window
" :help fzf-starting-fzf-in-a-popup-window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" set colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x>k <plug>(fzf-complete-word)
imap <c-x>f <plug>(fzf-complete-path)
imap <c-x>j <plug>(fzf-complete-file-ag)
imap <c-x>l <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

Shortcut (fzf) open buffer
      \ nnoremap <silent> <Space>ob :Buffers<CR>

" Shortcut (fzf) apply colorscheme
"       \ nnoremap <silent> <Space>ec :Colors<CR>

Shortcut (fzf) expose tag in any buffer
      \ nnoremap <silent> <Space>et :Tags<CR>

Shortcut (fzf) expose tag in buffer
      \ nnoremap <silent> <Space>eT :BTags<CR>

Shortcut (fzf) open file under working directory
      \ nnoremap <silent> <Space>of :Files<CR>

Shortcut (fzf) open file under buffer's directory
      \ nnoremap <silent> <Space>oF :execute 'Files' expand('%:h')<CR>

Shortcut (fzf) open git file (tracked by git)
      \ nnoremap <silent> <Space>og :GFiles<CR>

Shortcut (fzf) open git file that has changes
      \ nnoremap <silent> <Space>oG :GFiles?<CR>

Shortcut (fzf) expose line in any buffer
      \ nnoremap <silent> <Space>eL :Lines<CR>

Shortcut (fzf) expose line in buffer
      \ nnoremap <silent> <Space>el :BLines<CR>

" Shortcut (fzf) expose mark in buffer
"       \ nnoremap <silent> <Space>em :Marks<CR>

Shortcut (fzf) expose window in any tab
      \ nnoremap <silent> <Space>ew :Windows<CR>

Shortcut (fzf) reopen file from history
      \ nnoremap <silent> <Space>o. :History<CR>

Shortcut (fzf) repeat command from history
      \ nnoremap <silent> <Space>e; :History<CR>

Shortcut (fzf) repeat search from history
      \ nnoremap <silent> <Space>e/ :Hist/<CR>

Shortcut (fzf) browse git log
      \ nnoremap <silent> <Space>eg :Commits<CR>

Shortcut (fzf) browse git log for buffer
      \ nnoremap <silent> <Space>eG :BCommits<CR>

Shortcut (fzf) run command from menu
      \ nnoremap <silent> <Space>e: :Commands<CR>

Shortcut (fzf) trigger mapping / keybinding / shortcut
      \ nnoremap <silent> <Space>e<Space> :Maps<CR>

Shortcut (fzf) open help topic
      \ nnoremap <silent> <Space>oh :Helptags<CR>

Shortcut (fzf) apply filetype
      \ nnoremap <silent> <Space>eF :Filetypes<CR>
