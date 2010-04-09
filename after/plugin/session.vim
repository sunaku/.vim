finish " disable automatic session restoration on startup; run vim -S manually
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If vim was launched without any arguments or was launched without a session,
" then restore an existing saved session (if any) or start tracking a new one.

if argc() > 0
  finish
endif

let cmdline = get(systemlist('ps ho cmd $(ps ho ppid $$)'), 0, '')
if match(cmdline, '\v (-S|--?)( |$)') != -1
  finish
endif

if filereadable('Session.vim')
  silent! source Session.vim

  " do some adjustments after restoring the session
  autocmd VimEnter * call s:after_restoring_session()
  function! s:after_restoring_session() abort
    " refit to terminal and equal size
    let l:tabpagenr = tabpagenr()
    tabdo resize
    tabdo execute "normal! \<C-W>="
    execute 'normal! '. l:tabpagenr .'gt'

    " run ftdetect for current buffer
    doautocmd BufRead
  endfunction

elseif exists(':Obsession')
  autocmd VimEnter * Obsession
endif
