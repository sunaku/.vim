let g:tmux_navigator_no_mappings = 1

" I type Dvorak, hence the D-H-T-N-S sequence below.
" It is similar to the H-J-K-L-; sequence in QWERTY.

nnoremap <silent> <A-d> :TmuxNavigatePrevious<Return>
nnoremap <silent> <A-h> :TmuxNavigateLeft<Return>
nnoremap <silent> <A-t> :TmuxNavigateUp<Return>
nnoremap <silent> <A-n> :TmuxNavigateDown<Return>
nnoremap <silent> <A-s> :TmuxNavigateRight<Return>

" allow same keybindings to navigate from insert mode
imap <A-d> <Esc><A-d>
imap <A-h> <Esc><A-h>
imap <A-t> <Esc><A-t>
imap <A-n> <Esc><A-n>
imap <A-s> <Esc><A-s>
