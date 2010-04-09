function! shortcut#toggle_flag(option, flag, ...) abort
  execute 'let value = &' . a:option
  let operator = value =~ a:flag ? '-=' : '+='
  execute 'setlocal' a:option . operator . a:flag

  if a:0 > 0
    for flag in a:000
      call shortcut#toggle_flag(a:option, flag)
    endfor
  endif
endfunction
