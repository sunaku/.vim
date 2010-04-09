let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1

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

autocmd VimEnter * call s:unite_setup_once()
function! s:unite_setup_once()

  " use fuzzy matching by default for most Unite sources
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom#source('line', 'matchers', 'matcher_fuzzy')

  " ignore certain files and directories while searching
  call unite#custom_source('file,file_rec,file_rec/async,grep',
        \ 'ignore_pattern', join([
        \ '\.git/',
        \ '\.bundle/',
        \ '\.rubygems/',
        \ 'vendor/',
        \ '_build/',
        \ 'deps/',
        \ ], '\|'))

endfunction
