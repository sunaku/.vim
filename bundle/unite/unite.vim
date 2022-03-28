let g:unite_enable_start_insert = 1

" make matching portions of candidates easier to discern
highlight default link uniteCandidateInputKeyword Search

" prevent `Unite -no-split` from populating the <C-O> / <C-I> jumplist
" https://github.com/Shougo/unite.vim/issues/278#issuecomment-24491066
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  setlocal nopaste " make sure insert mode works correctly when paste is on
  nmap <silent> <buffer> <C-C> <Plug>(unite_exit)
  imap <silent> <buffer> <C-C> <Plug>(unite_insert_leave)<Bar><Plug>(unite_exit)
  imap <silent> <buffer> <C-J> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-K> <Plug>(unite_select_previous_line)
  imap <silent> <buffer> <C-R> <Plug>(unite_narrowing_input_history)
  imap <silent> <buffer> <C-W> <Plug>(unite_delete_backward_path)
endfunction

Shortcut (unite) expose filer in working directory
      \ nnoremap <silent> <Space>od :Unite file file/new<CR>

Shortcut (unite) expose filer in buffer's directory
      \ nnoremap <silent> <Space>oD :UniteWithBufferDir file file/new<CR>
