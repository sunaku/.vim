set shell=/bin/sh " use Bourne shell for command substitution
set history=10000 " remember this many commands and searches
set confirm       " ask user before aborting an action
set wildmenu      " tab-completion menu for command mode
set wildmode=list:longest,full

" colonless entrance into command mode
noremap ; :
noremap ! :!

" colonless replaying of recent command
noremap @; @:
noremap @! :!<Up><Return>

" enable EMACS-style cursor movement inside command mode
" https://statico.github.io/vim.html#rudimentary-essentials
cnoremap <C-a> <Home>
" cnoremap <C-b> <Left>
" cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>
cnoremap <A-d> <S-Right><Delete>
cnoremap <C-g> <C-c>
