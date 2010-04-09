let g:swap_no_default_key_mappings = 1

Shortcut (swap) swap delimited item to the left
      \ nmap g< <Plug>(swap-prev)

Shortcut (swap) swap delimited item to the right
      \ nmap g> <Plug>(swap-next)

Shortcut (swap) enter interactive swapping mode
      \ nmap g= <Plug>(swap-interactive)
      \|xmap g= <Plug>(swap-interactive)

" " textobjects for swappable items
" omap i, <Plug>(swap-textobject-i)
" xmap i, <Plug>(swap-textobject-i)
" omap a, <Plug>(swap-textobject-a)
" xmap a, <Plug>(swap-textobject-a)
