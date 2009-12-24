setlocal textwidth=78
setlocal spell

augroup markdown_preview
  autocmd!
  autocmd BufWritePost *.markdown :silent !markdown % > %.html &
augroup END
