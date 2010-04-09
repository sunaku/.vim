nnoremap <Leader>gb :Gblame<Return>
nnoremap <Leader>gc :Gcommit<Return>
nnoremap <Leader>gd :Gdiff<Return>
nnoremap <Leader>ge :Gedit<Return>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>g. :Gcd<Return>
nnoremap <Leader>gl :Extradite<Return>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gM :Gmove!<Space>
nnoremap <Leader>gr :Gread<Return>
nnoremap <Leader>gR :Gread!<Return>
nnoremap <Leader>gs :Gstatus<Return>
nnoremap <Leader>gw :Gwrite<Return>
nnoremap <Leader>gW :Gwrite!<Return>
nnoremap <Leader>gx :Gremove<Return>
nnoremap <Leader>gX :Gremove!<Return>

if exists('*fugitive#statusline')
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" https://github.com/tpope/vim-fugitive/pull/90
autocmd QuickFixCmdPost *grep* cwindow
