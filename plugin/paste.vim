" paste yanked text while preserving the unnamed register
vnoremap <silent> p p:call setreg('"', getreg(0))<Return>
vnoremap <silent> P P:call setreg('"', getreg(0))<Return>
