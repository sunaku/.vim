let g:gutentags_ctags_exclude = ['*.json']

" prevent gutentags from indexing the entire home directory
" https://github.com/ludovicchabant/vim-gutentags/issues/13
let g:gutentags_exclude_project_root = [$HOME]

set statusline+=%{gutentags#statusline()}
