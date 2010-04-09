augroup polybar_reload_config
  autocmd!
  autocmd BufWritePost .config/polybar/config :silent !killall -USR1 polybar &
augroup END
