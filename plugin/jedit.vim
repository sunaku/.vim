" jEdit emulation for Vim

"-------------------------------------------------------------------------------
" navigation
"-------------------------------------------------------------------------------

" paragraphs
noremap <C-Up> {
noremap <C-Down> }

" folds
noremap <A-Up> zk
noremap <A-Down> zj

" buffers
noremap <C-PageUp> :bprevious<Enter>
noremap <C-PageDown> :bnext<Enter>

" splits
noremap <A-PageUp> <C-W>W
noremap <A-PageDown> <C-W>w

"-------------------------------------------------------------------------------
" fold management
"-------------------------------------------------------------------------------
"
" These shortcuts are supposed to be prefixed with <Alt>
" (as in jEdit) but Vim does not allow this (in the case
" of <Alt><Enter> and <Alt><Shift><Enter>) so our
" next-best alternative is to prefix them with <Control>.
"
" Also, the <Left> and <Right> keys have
" been improvised to respectively decrease
" and increase the fold level globally in
" the buffer.  This is not found in jEdit.

" open fold
noremap <Enter> zo
noremap <S-Enter> zO

" close fold
noremap <Backspace> zc
noremap <S-Backspace> zM zv zc

" decrease fold level (zoom out)
noremap <A-Left> zm
noremap <AS-Left> zM

" increase fold level (zoom in)
noremap <A-Right> zr
noremap <AS-Right> zR

"-------------------------------------------------------------------------------
" split management
"-------------------------------------------------------------------------------
"
" These shortcuts are supposed to be prefixed with <Control> (as in
" jEdit) but Vim does not allow this (in the case of <Control><1>)
" so our next-best alternative is to prefix them with <Alt>.
"

" make Vim recognize <Alt-Digit> shortcuts
" http://vim.wikia.com/wiki/Fix_meta-keys_that_break_out_of_Insert_mode
if !has('gui_running')
  let i = 0
  while i < 10
    exec "set <A-". toupper(i) .">=\e". i
    let i = i + 1
  endwhile
endif

noremap <A-1> <C-W>o
noremap <A-2> <C-W>s <C-W><Down>
noremap <A-3> <C-W>v <C-W><Right>
noremap <A-4> <C-W>c
noremap <A-5> <C-W>=
noremap <A-6> <C-W>_
noremap <A-7> <C-W><Bar>

"-------------------------------------------------------------------------------
" searching
"-------------------------------------------------------------------------------

nnoremap <A-.> [I
