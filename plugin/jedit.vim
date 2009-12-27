" jEdit emulation for Vim and GVim

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
noremap <C-PageUp> :bprev<Enter>
noremap <C-PageDown> :bnext<Enter>

" splits
noremap <A-PageUp> <C-W>W
noremap <A-PageDown> <C-W>w

"-------------------------------------------------------------------------------
" fold management
"-------------------------------------------------------------------------------

" The following shortcuts are supposed to be prefixed with
" <Alt> just like in jEdit but Vim and GVim do not allow this
" (in the case of <Alt><Enter> and <Alt><Shift><Enter>) so
" our next-best alternative is to omit the prefix completely.

" toggle fold
noremap <Space> za

" open fold
noremap <Enter> zo

" open fold recursively
noremap <S-Enter> zO

" close fold
noremap <Backspace> zc

" close fold recursively
noremap <S-Backspace> zM zv zc

" The following shortcuts are improvised.  They do not exist in jEdit.

" decrease fold level (zoom out)
noremap <A-Left> zm

" close all folds
noremap <AS-Left> zM

" increase fold level (zoom in)
noremap <A-Right> zr

" open all folds
noremap <AS-Right> zR

"-------------------------------------------------------------------------------
" split management
"-------------------------------------------------------------------------------

" make Vim recognize <Alt-Digit> shortcuts
" http://vim.wikia.com/wiki/Fix_meta-keys_that_break_out_of_Insert_mode
if !has('gui_running')
  let i = 0
  while i < 10
    exec "set <A-". i .">=\e". i
    let i = i + 1
  endwhile
endif

" The following shortcuts are supposed to be
" prefixed with <Control> just like in jEdit,
" but Vim and GVim do not allow this (in the
" case of <Control><1>) so our next-best
" alternative is to prefix them with <Alt>.

" make this the only split
noremap <A-1> <C-W>o

" split horizontally and focus the new split
noremap <A-2> <C-W>s <C-W><Down>

" split vertically and focus the new split
noremap <A-3> <C-W>v <C-W><Right>

" The following shortcuts are improvised.  They do not exist in jEdit.

" close current split
noremap <A-4> <C-W>c

" make all splits the same size
noremap <A-5> <C-W>=

" expand current split vertically
noremap <A-6> <C-W>_

" expand current split horizontally
noremap <A-7> <C-W><Bar>

"-------------------------------------------------------------------------------
" searching
"-------------------------------------------------------------------------------

" show all matches of word under cursor in current buffer
nnoremap <A-.> [I
