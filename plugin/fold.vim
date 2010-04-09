set foldenable
set foldmethod=indent " indentation defines folds
set foldlevelstart=99 " close folds below this depth, initially

" go to adjacent folds
nnoremap <silent> <C-Up>   :call <SID>GotoAdjacentFold('zk', '[z')<CR>
nnoremap <silent> <C-Down> :call <SID>GotoAdjacentFold('zj', ']z')<CR>
nnoremap <C-Left> [[
nnoremap <C-Right> ]]

" zk and zj don't travel out of the current fold level :(
function! s:GotoAdjacentFold(first_try, second_try) abort
  let starting_position = winsaveview()
  execute 'normal!' a:first_try
  if winsaveview() == starting_position
    execute 'normal!' a:second_try
  endif
  normal! ^
endfunction

" open and close folds
nnoremap <A-Up> zc
nnoremap <A-Down> zo

" change the foldlevel
nnoremap <A-Left> zm
nnoremap <A-Right> zr

for i in range(0,9)
  execute 'Shortcut fold up to level '. i .' nnoremap z'. i .' zM'. i .'zr'
endfor

Shortcut close all other folds in buffer
      \ nnoremap <Space>Dz zMzv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
"
"         -- http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
"
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
