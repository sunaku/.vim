Shortcut! g@ (FIGlet) decorate {motion} or visual selection as ASCII art

Shortcut (FIGlet) comment {motion} or visual selection as ASCII art
      \ nnoremap <silent> <Leader>g@ V:call CommentUsingFIGlet()<CR>
      \|vnoremap <silent> <Leader>g@ :<C-U>call CommentUsingFIGlet()<CR>

function! CommentUsingFIGlet() abort
  " run figlet and mark beginning of lines
  '<,'>FIGlet
  execute "normal! 0\<C-V>`]I.\<C-C>V`]"

  " comment-out the lines figlet'ed above
  execute "normal \<Plug>NERDCommenterComment"

  " remove the marks at beginning of lines
  execute "normal! f.\<C-V>`]f.x"
endfunction
