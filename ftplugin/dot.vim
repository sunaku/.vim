augroup graphviz_preview
  autocmd!
  autocmd BufWritePost *.{gv,dot} GraphvizCompile
augroup END
