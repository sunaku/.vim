" masquerade rxvt as xterm so that arrow keys work correctly in insert mode
if &term =~ 'rxvt'
  execute 'set term=' . substitute(&term, '\vrxvt(-unicode)?', 'xterm', '')
endif
