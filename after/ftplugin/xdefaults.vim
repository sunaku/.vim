augroup xdefaults_preview
  autocmd!
  autocmd BufWritePost .[Xx]{defaults,resources} :silent !xrdb -merge % &
augroup END
