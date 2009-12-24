if ! has('nvim')
  finish
endif

" ESC quits terminal mode
tnoremap <Esc> <C-\><C-N>

" on focus, input to term
autocmd WinEnter term://* normal! i
