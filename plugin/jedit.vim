" jEdit emulation for Vim

" fold navigation
"
" These shortcuts are supposed to be prefixed
" with <Alt> (as in jEdit) but Vim does not
" allow this (in the case of <Alt><Enter> and
" <Alt><Shift><Enter>) so our next-best
" alternative is to prefix them to <Control>.
"
" Also, the <Left> and <Right> keys have
" been improvised to respectively decrease
" and increase the fold level globally in
" the buffer.  This is not found in jEdit.
"
noremap <C-Up> zk
noremap <C-Down> zj
noremap <C-Left> zm
noremap <CS-Left> zM
noremap <C-Right> zr
noremap <CS-Right> zR
noremap <C-Enter> zo
noremap <CS-Enter> zO
noremap <C-Backspace> zc
noremap <CS-Backspace> zM zv zc

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

" searching
nnoremap <A-.> [I
