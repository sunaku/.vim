" reset cursor position to the top left corner
" by clearing out the fileinfo register before
" plugin/neovim.vim has a chance to restore it
" later on during its autocmd BufReadPost hook
autocmd FileType gitrebase normal! m"
