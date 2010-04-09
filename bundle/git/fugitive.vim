if exists('*fugitive#statusline')
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" https://github.com/tpope/vim-fugitive/pull/90
autocmd QuickFixCmdPost *grep* cwindow
