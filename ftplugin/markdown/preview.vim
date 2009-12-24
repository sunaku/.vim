augroup markdown_preview
  autocmd!
  autocmd BufWritePost *.{markdown,mdown,mkdn,mkd,md} :silent !markdown % > %.html &
augroup END
