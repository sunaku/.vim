" If you want to use vim-sandwich with vim-surround keymappings.
runtime macros/sandwich/keymap/surround.vim
xmap s <Plug>(operator-sandwich-add)
nmap <Leader>s <Plug>(operator-sandwich-add)

" Textobjects to select the nearest surrounded text automatically.
xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)

" Textobjects to select a text surrounded by same characters user input.
xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)
