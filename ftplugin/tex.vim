augroup ftplugin_tex
  autocmd!
  autocmd BufWritePost *.ly :!cd "%:h" && lilypond "%:t"
augroup END
