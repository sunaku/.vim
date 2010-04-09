call shortcut#map('<Space> <C-A>', 'Number -> Sequence -> Increment')
call shortcut#map('<Space> <C-X>', 'Number -> Sequence -> Decrement')

function! Shortcut_number_sequence_increment() abort
  if shortcut#mode() == 'n'
    execute "normal \<Plug>SequenceN_Increment"
  else
    execute "normal \<Plug>SequenceV_Increment"
  endif
endfunction

function! Shortcut_number_sequence_decrement() abort
  if shortcut#mode() == 'n'
    execute "normal \<Plug>SequenceN_Decrement"
  else
    execute "normal \<Plug>SequenceV_Decrement"
  endif
endfunction
