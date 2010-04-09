let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1

nnoremap <Leader>u :Unite -no-split<Space>
nnoremap <silent> <Leader>` :Unite -no-split mark jump<Return>
nnoremap <silent> <Leader>\ :Unite -no-split command<Return>
nnoremap <silent> <Leader>@ :Unite -no-split register<Return>
nnoremap <silent> <Leader>[ :Unite -no-split outline<Return>
nnoremap <silent> <Leader>] :Unite -no-split tag<Return>
nnoremap <silent> <Leader>5 :Unite -no-split window<Return>
nnoremap <silent> <Leader>6 :Unite -no-split buffer file_mru<Return>
nnoremap <silent> <Leader>8 :Unite -no-split line<Return>
nnoremap <silent> <Leader>* :UniteWithCursorWord -no-split -immediately line<Return>
nnoremap <silent> <Leader>P :Unite -no-split history/yank<Return>
nnoremap <silent> <Leader>p :Unite -no-split history/yank -default-action=append<Return>
nnoremap <silent> <Leader>a :Unite -no-split file/vcs file_rec/async<Return>
nnoremap <silent> <Leader>A :UniteWithBufferDir -no-split file_rec/async<Return>
nnoremap <silent> <Leader>o :Unite -no-split file file/new<Return>
nnoremap <silent> <Leader>O :UniteWithBufferDir -no-split file file/new<Return>

" make matching portions of candidates easier to discern
highlight default link uniteCandidateInputKeyword Search

" prevent `Unite -no-split` from populating the <c-o> / <c-i> jumplist
" https://github.com/Shougo/unite.vim/issues/278#issuecomment-24491066
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  setlocal nopaste " make sure insert mode works correctly when paste is on
  nmap <silent> <buffer> <C-c> <Plug>(unite_all_exit)
  imap <silent> <buffer> <C-c> <Plug>(unite_insert_leave)<Bar><Plug>(unite_all_exit)
  imap <silent> <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <silent> <buffer> <C-r> <Plug>(unite_narrowing_input_history)
  imap <silent> <buffer> <C-w> <Plug>(unite_delete_backward_path)
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
        \ 'doc/',
        \ ], '\|'))

endfunction
