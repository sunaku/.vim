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
  autocmd VimEnter * call s:equal_window_sizes()
  function! s:equal_window_sizes() abort
    let l:tabpagenr = tabpagenr()
    tabdo execute "normal! \<C-W>="
    execute 'normal! '. l:tabpagenr .'gt'
  endfunction

elseif exists(':Obsession')
  autocmd VimEnter * Obsession
endif
