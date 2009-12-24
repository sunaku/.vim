augroup save_xbindkeys
  autocmd!
  autocmd BufWritePost .xbindkeysrc* :silent !killall -HUP xbindkeys
augroup END
