nnoremap <silent> <Leader>gb :Gblame<Return>
nnoremap <silent> <Leader>gc :Gcommit<Return>
nnoremap <silent> <Leader>gC :Gcommit --amend<Return>
nnoremap <silent> <Leader>gd :Gdiff<Return>
nnoremap <silent> <Leader>ge :Gedit<Return>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <silent> <Leader>g. :Gcd<Return>
nnoremap <silent> <Leader>gl :Extradite<Return>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gM :Gmove!<Space>
nnoremap <silent> <Leader>gr :Gread<Return>
nnoremap <silent> <Leader>gR :Gread!<Return>
nnoremap <silent> <Leader>gs :Gstatus<Return>
nnoremap <silent> <Leader>gw :Gwrite<Return>
nnoremap <silent> <Leader>gW :Gwrite!<Return>
nnoremap <silent> <Leader>gx :Gremove<Return>
nnoremap <silent> <Leader>gX :Gremove!<Return>

if exists('*fugitive#statusline')
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" https://github.com/tpope/vim-fugitive/pull/90
autocmd QuickFixCmdPost *grep* cwindow
