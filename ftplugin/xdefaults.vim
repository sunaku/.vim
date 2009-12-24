augroup xdefaults_apply_config
  autocmd!
  autocmd BufWritePost .[Xx]{defaults,resources}
        \ :silent write !xrdb -merge 2>&1 | fgrep -A2 error:
augroup END
