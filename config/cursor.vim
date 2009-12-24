" highlight the current line in UNFOCUSED windows
autocmd WinEnter,BufWinEnter * setlocal cursorline&
autocmd WinLeave,BufWinLeave * setlocal cursorline
