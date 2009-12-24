augroup xbindkeys_apply_config
  autocmd!
  autocmd BufWritePost .xbindkeysrc :silent !killall -HUP xbindkeys
augroup END
