if ! has('nvim')
  finish
endif

" ESC quits terminal mode
tnoremap <Esc> <C-\><C-N>

" on focus, input to term
" autocmd WinEnter term://* normal! i

" kill off any embedded zombies after exiting
autocmd VimLeave * call system('( sleep 5; pkill -9 -P 1 -f "nvim.+--embed" ) &')
