" be consistent with C and D which reach the end of line
nnoremap Y y$

" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction
noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>
