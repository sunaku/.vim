" for :SudoWrite authentication in Artix Linux
" https://github.com/tpope/vim-eunuch/issues/69
if !exists('$SUDO_ASKPASS')
  let $SUDO_ASKPASS = '/usr/lib/ssh/x11-ssh-askpass'
endif

Shortcut (eunuch) rename file
      \ nnoremap <silent> <Space>cf :call feedkeys(':Rename '.expand('%:t'), 't')<CR>

Shortcut (eunuch) prompt to delete file
      \ nnoremap <silent> <Space>df
      \ :
      \ if confirm("Delete file?", "&Yes\n&No", 2) == 1 <Bar>
      \   Remove <Bar>
      \ endif <CR>
