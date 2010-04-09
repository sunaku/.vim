Shortcut toggle code folding in buffer
      \ nnoremap <silent> coz :setlocal foldenable!<CR>

Shortcut toggle automatic formatting in buffer
      \ nnoremap <silent> coQ :call ToggleOptionFlags('formatoptions', ['a','t'])<CR>

function! ToggleOptionFlag(option, flag)
  execute 'let l:value = &' . a:option
  let l:operator = l:value =~ a:flag ? '-=' : '+='
  execute 'setlocal' a:option . l:operator . a:flag
  echo a:option . l:operator . a:flag
endfunction

function! ToggleOptionFlags(option, flags)
  map(flags, 'call ToggleOptionFlag(a:option, v:val)')
endfunction
