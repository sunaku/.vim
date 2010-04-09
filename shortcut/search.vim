" minus sign repeats f/F/t/T search forward
" NOTE: this is taken over by FanFingTastic
" noremap - ;

" underscore repeats f/F/t/T search backward
" NOTE: this is taken over by FanFingTastic
" noremap _ ,

" make <C-L> (redraw screen) also turn off
" search highlighting until the next search
" http://vim.wikia.com/wiki/Example_vimrc
nnoremap <silent> <C-L> :nohlsearch<Return><C-L>

call shortcut#map('<Space> /', 'Search -> Fuzzy', 'FuzzySearch')
call shortcut#map('<Space> ?', 'Search -> Codebase', 'call feedkeys(":Ack ", "n")')
call shortcut#map('<Space> &', 'Search -> Replace (interactive)')
call shortcut#map('<Space> *', 'Search -> Replace (interactive) -> Word under cursor')

function! Shortcut_search_replace_interactive() abort
  if shortcut#mode() == 'n'
    OverCommandLine %S/
  else
    OverCommandLine '<,'>S/
  endif
endfunction

function! Shortcut_search_replace_interactive_word_under_cursor() abort
  let suffix = expand('<cword>') . '/'
  if shortcut#mode() == 'n'
    execute 'OverCommandLine %S/' . suffix
  else
    execute "OverCommandLine '<,'>S/" . suffix
  endif
endfunction
