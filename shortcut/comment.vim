call shortcut#map('<Space> c a', 'Comment -> Alternate', '<Plug>NERDCommenterAltDelims')
call shortcut#map('<Space> c u', 'Comment -> Uncomment', '<Plug>NERDCommenterUncomment')
call shortcut#map('<Space> c b', 'Comment -> Align -> Both', '<Plug>NERDCommenterAlignBoth')
call shortcut#map('<Space> c l', 'Comment -> Align -> Left', '<Plug>NERDCommenterAlignLeft')
call shortcut#map('<Space> c A', 'Comment -> Append', '<Plug>NERDCommenterAppend')
call shortcut#map('<Space> c y', 'Comment -> Yank', '<Plug>NERDCommenterYank')
call shortcut#map('<Space> c s', 'Comment -> Sexy', '<Plug>NERDCommenterSexy')
call shortcut#map('<Space> c i', 'Comment -> Invert', '<Plug>NERDCommenterInvert')
call shortcut#map('<Space> c $', 'Comment -> To EOL', '<Plug>NERDCommenterToEOL')
call shortcut#map('<Space> c n', 'Comment -> Nested', '<Plug>NERDCommenterNested')
call shortcut#map('<Space> c m', 'Comment -> Minimal', '<Plug>NERDCommenterMinimal')
call shortcut#map('<Space> t c', 'Comment -> Toggle', '<Plug>NERDCommenterToggle')
call shortcut#map('<Space> c c', 'Comment -> Comment', '<Plug>NERDCommenterComment')
call shortcut#map('<Space> c P', 'Comment -> Yank -> Paste above', 'Comment -> Yank', 'normal! `[P')
call shortcut#map('<Space> c p', 'Comment -> Yank -> Paste below', 'Comment -> Yank', 'normal! `]p')
call shortcut#map('<Space> c @', 'Comment -> ASCII art (figlet)')

function! Shortcut_comment_ascii_art_figlet() abort
  " use current line if nothing is selected
  if shortcut#mode() == 'n'
    normal! V
  endif

  " run figlet and mark beginning of lines
  execute "normal! g@0\<C-V>`]I.\<C-C>V`]"

  " comment-out the lines figlet'ed above
  call shortcut#run('Comment -> Comment')

  " remove the marks at beginning of lines
  execute "normal! f.\<C-V>`]f.x"
endfunction
