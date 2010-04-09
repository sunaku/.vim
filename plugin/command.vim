set shell=/bin/sh " use Bourne shell for command substitution
set history=10000 " remember this many commands and searches
set confirm       " ask user before aborting an action
set wildmenu      " tab-completion menu for command mode
if !has('nvim') | set wildmode=list:longest,full | endif

" shiftless entrance into command mode for internal commands
noremap ; :
nnoremap <silent> ; :call feedkeys(':', 'nt')<CR>
vnoremap <silent> ; :<C-U>call feedkeys(":'<,'>", 'nt')<CR>
noremap <C-\>; ;
noremap @; @:
noremap @<C-\>; @;
noremap ! :!
noremap <C-\>! !

" enable EMACS-style cursor movement inside command mode
" https://statico.github.io/vim.html#rudimentary-essentials
cnoremap <C-A> <Home>
" cnoremap <C-B> <Left>
" cnoremap <C-F> <Right>
cnoremap <C-D> <Delete>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>
cnoremap <A-d> <S-Right><Delete>
cnoremap <C-G> <C-C>
