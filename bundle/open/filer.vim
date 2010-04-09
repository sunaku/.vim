nnoremap <silent> <Leader>f :VimFilerCurrentDir -quit<Return>
nnoremap <silent> <Leader>F :VimFilerBufferDir -quit<Return>

" prevent `VimFiler` from populating the <C-o> / <C-i> jumplist
" https://github.com/Shougo/unite.vim/issues/278#issuecomment-24491066
autocmd BufLeave \[vimfiler\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
  nmap <buffer> <C-c> <Plug>(vimfiler_hide)
endfunction
