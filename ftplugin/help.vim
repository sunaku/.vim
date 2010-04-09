augroup VimHelpLint
  autocmd!
  autocmd BufWritePost <buffer> :silent VimhelpLint!
augroup END
