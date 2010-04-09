let g:tmux_navigator_no_mappings = 1

" See http://sunaku.github.io/tmux-select-pane.html
nnoremap <silent> <A-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <A-j> :TmuxNavigateDown<CR>
nnoremap <silent> <A-k> :TmuxNavigateUp<CR>
nnoremap <silent> <A-l> :TmuxNavigateRight<CR>
nnoremap <silent> <A-;> :TmuxNavigatePrevious<CR>

" allow same keybindings to navigate from insert mode
imap <A-h> <Esc><A-h>
imap <A-j> <Esc><A-j>
imap <A-k> <Esc><A-k>
imap <A-l> <Esc><A-l>
imap <A-;> <Esc><A-;>

" allow same keybindings to navigate from terminal mode
if has('nvim')
  tmap <A-h> <Esc><A-h>
  tmap <A-j> <Esc><A-j>
  tmap <A-k> <Esc><A-k>
  tmap <A-l> <Esc><A-l>
  tmap <A-;> <Esc><A-;>
endif
