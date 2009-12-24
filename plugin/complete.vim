" like smartcase but for completion
set infercase

" enable i_CTRL-X_CTRL-O completion using syntax highlighting definitions
set omnifunc=syntaxcomplete#Complete

" don't scan included files; relying on the .tags file is more performant
set complete-=i
