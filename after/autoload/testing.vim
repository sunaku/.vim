" helper for testing out new shortcuts
function! testing#shortcut(shortcut)
  let label = substitute(a:shortcut, '[<>]', ' ', 'g')
  execute "noremap ". a:shortcut ." :echo '". label ."'<Return>"
endfunction
