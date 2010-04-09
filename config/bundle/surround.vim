" allow lowercase "s" to activate surround plugin in visual mode
autocmd VimEnter * xmap s S

" switch from double quotes to single quotes (overwrites `z)
nmap <Leader>' mzcs"'`z

" switch from single quotes to double quotes (overwrites `z)
nmap <Leader>" mzcs'"`z

" switch from single quotes to Ruby symbol notation (overwrites `z)
nmap <Leader>: mzds'i:<Esc>`z

" switch from Ruby symbol notation to single quotes (overwrites `z)
nmap <Leader>; mzF:xves'`z

" remove parentheses around function call arguments (overwrites `z)
nmap <Leader><Space> mzds)i<Space><Esc>`z

" surround function call arguments with parentheses (overwrites `z and @/)
nmap <Leader>) mz?[^,] ?e<Return>xv/[^,]\( \<Bar>$\)/<Return>s)`z
