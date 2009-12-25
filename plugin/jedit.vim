" jEdit emulation for Vim

" paragraph navigation
noremap <C-Up> {
noremap <C-Down> }

" fold navigation
"noremap <A-Up>
"noremap <A-Down>

" buffer navigation
noremap <C-PageUp> :bp<CR>
noremap <C-PageDown> :bn<CR>
" TODO: buffer switcher / fuzzy finder

" split navigation
noremap <A-PageUp> <C-W>W
noremap <A-PageDown> <C-W>w

" split management
"
" These shortcuts are supposed to be bound to <Control><Number>
" (as in jEdit) but Vim does not allow this for portability [1]
" so our next-best alternative is to bind them to <Alt><Number>.
"
" [1]: http://www.mail-archive.com/vim_use@googlegroups.com/msg06174.html
"
noremap <A-1> <C-W>o
noremap <A-2> <C-W>s <C-W><Down>
noremap <A-3> <C-W>v <C-W><Right>
