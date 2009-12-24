" TLDR: Use <C-c> instead of <Esc> to always unambiguously exit insert mode!
"
" Why?  Because Alt-key combos and arrow keys are compound sequences that
" contain <Esc>: this prevents Vim from easily recognizing a single <Esc> key
" from an embedded <Esc> that occurs as part of Alt-key combos or arrow keys.
" However, that does not mean recognition is impossible; see `:help ttimeout`.
"
" This file emulates `:set noesckeys` so that Vim recognizes Alt-key combos
" and arrow keys in insert mode.  This is necessary because `:set noesckeys`
" makes arrow keys insert "ABCD" on new lines instead of moving the cursor.

" don't bother with the following workarounds if `:set noesckeys` is enabled
if !&esckeys
  finish
endif

" immediately exit insert mode when <Esc> is pressed; don't wait for keycodes
set ttimeout ttimeoutlen=0

" Sometimes, even the ttimeoutlen=0 above is not enough for fast typists who
" type normal mode command keys like `u` (to undo) after exiting from insert
" mode with <Esc>, only to find that (1) they are still in insert mode and (2)
" their buffer now contains an accented Latin character like `õ` (from <A-U>)
" so the following escape from insert mode and replay the key in normal mode:

" Alt + lowercase
inoremap ð <C-c>p
inoremap ù <C-c>y
inoremap æ <C-c>f
inoremap ã <C-c>c
inoremap ç <C-c>g
inoremap ò <C-c>r
inoremap ì <C-c>l
inoremap á <C-c>a
inoremap ï <C-c>o
inoremap å <C-c>e
inoremap õ <C-c>u
inoremap é <C-c>i
inoremap ä <C-c>d
inoremap è <C-c>h
inoremap ô <C-c>t
inoremap î <C-c>n
inoremap ó <C-c>s
inoremap ñ <C-c>q
inoremap ê <C-c>j
inoremap ë <C-c>k
inoremap ø <C-c>x
inoremap â <C-c>b
inoremap í <C-c>m
inoremap ÷ <C-c>w
inoremap ö <C-c>v
inoremap ú <C-c>z

" Alt + uppercase
inoremap Ð <C-c>P
inoremap Ù <C-c>Y
inoremap Æ <C-c>F
inoremap Ã <C-c>C
inoremap Ç <C-c>G
inoremap Ò <C-c>R
inoremap Ì <C-c>L
inoremap Á <C-c>A
inoremap Ï <C-c>O
inoremap Å <C-c>E
inoremap Õ <C-c>U
inoremap É <C-c>I
inoremap Ä <C-c>D
inoremap È <C-c>H
inoremap Ô <C-c>T
inoremap Î <C-c>N
inoremap Ó <C-c>S
inoremap Ñ <C-c>Q
inoremap Ê <C-c>J
inoremap Ë <C-c>K
inoremap Ø <C-c>X
inoremap Â <C-c>B
inoremap Í <C-c>M
inoremap × <C-c>W
inoremap Ö <C-c>V
inoremap Ú <C-c>Z

" The same problem applies when Alt-key combos or arrow keys are typed while
" recording macros, so we apply the above workaround while playing them back:

let s:last_played_register = system('grep "^\".@" ~/.viminfo')[1]

" Plays the given macro register as if it were recorded under `:set noesckeys`
" by treating all <Esc> keys in the macro as <C-c> keys to exit insert mode.
function! PlayMacroNoEscKeys(register)
  let l:register = a:register == '@' ? s:last_played_register : a:register
  let l:original = getreg(l:register)
  try
    call setreg(l:register, substitute(l:original, "\e", "\3", 'g'))
    execute 'normal!' v:count1 . '@' . l:register
    let s:last_played_register = l:register
  finally
    call setreg(l:register, l:original)
  endtry
endfunction

" map @{0-9a-z".=*+} to emulate `:set noesckeys` while playing macro registers
for s:register in [    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
      \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      \ '"', '.', '*', '+', '@' ] " @ isn't a register but it will map @@ here
  execute 'nnoremap <silent> @' . s:register ':<C-U>call'
        \ 'PlayMacroNoEscKeys("' . escape(s:register, '"') . '")<Return>'
endfor
