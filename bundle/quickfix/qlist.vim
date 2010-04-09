Shortcut! [I  (quickfix) list occurences  of word at cursor from top of file
Shortcut! ]I  (quickfix) list occurences  of word at cursor from here onward
Shortcut! [D  (quickfix) list definitions of word at cursor from top of file
Shortcut! ]D  (quickfix) list definitions of word at cursor from here onward

augroup quickfix_automatic_open_or_update
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END
