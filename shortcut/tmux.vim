call shortcut#map('<Space> o x', 'Tmux -> Set target pane', 'SlimuxREPLConfigure')
call shortcut#map('<Space> W x', 'Tmux -> Send buffer', 'SlimuxREPLSendBuffer')
call shortcut#map('<Space> w x', 'Tmux -> Send line or selection')

function! Shortcut_tmux_send_line_or_selection() abort
  if shortcut#mode() == 'n'
    SlimuxREPLSendLine
  else
    SlimuxREPLSendSelection
  endif
endfunction
