nnoremap <silent> coN :setlocal relativenumber!<Return>
nnoremap <silent> cof :call ToggleOptionFlags('formatoptions', ['a','t'])<Return>
nnoremap <silent> cop :setlocal paste!<Return>
nnoremap <silent> cos :setlocal spell!<Return>
nnoremap <silent> coz :setlocal foldenable!<Return>

function! ToggleOptionFlag(option, flag)
  execute 'let l:value = &' . a:option
  let l:operator = l:value =~ a:flag ? '-=' : '+='
  execute 'setlocal' a:option . l:operator . a:flag
endfunction

function! ToggleOptionFlags(option, flags)
  map(flags, 'call ToggleOptionFlag(a:option, v:val)')
endfunction
