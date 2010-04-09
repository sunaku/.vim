" prevent `VimFiler` from populating the <C-O> / <C-I> jumplist
" https://github.com/Shougo/unite.vim/issues/278#issuecomment-24491066
autocmd BufLeave \[vimfiler\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
  nmap <buffer> <C-C> <Plug>(vimfiler_hide)
  nmap <buffer> u <Plug>(vimfiler_smart_h)
endfunction

Shortcut (VimFiler) browse working directory
      \ nnoremap <silent> <Space>od :VimFilerCurrentDir -quit<CR>

Shortcut (VimFiler) browse buffer directory
      \ nnoremap <silent> <Space>oD :VimFilerBufferDir -quit<CR>
