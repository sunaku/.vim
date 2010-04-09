" prevent gutentags from indexing the entire home directory
" https://github.com/ludovicchabant/vim-gutentags/issues/13
let s:notags = expand('~/.notags')
if !filereadable(s:notags)
  call writefile([], s:notags)
endif
