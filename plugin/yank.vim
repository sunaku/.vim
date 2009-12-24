" be consistent with C and D which reach the end of line
nnoremap Y y$

" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
noremap <silent> <Leader>y y:call system('yank > /dev/tty', @0)<Return>
