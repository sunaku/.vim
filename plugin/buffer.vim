set autoread " try to reload buffer changed on disk
set hidden " lets you switch buffers without saving
set nostartofline " preserves cursor when switching

function! StripTrailingWhitespace() abort
" http://vim.wikia.com/wiki/Remove_trailing_spaces
  if !&binary && &filetype != 'diff'
    let l:cursor = winsaveview()
    if &filetype == 'mail'
      " preserve space after e-mail signature separator
      silent g/\(^--\)\@<!\s\+$/s///
    else
      silent g/\s\+$/s///
    endif
    call winrestview(l:cursor)
  endif
endfunction

Shortcut reload buffer from file
      \ nnoremap <silent> <Space>rb :confirm edit<CR>

Shortcut reload buffer from file forcefully
      \ nnoremap <silent> <Space>Rb :edit!<CR>

Shortcut write buffer to file
      \ nnoremap <silent> <Space>wb :write<CR>

Shortcut write buffer to file forcefully
      \ nnoremap <silent> <Space>Wb :write!<CR>

Shortcut yank buffer contents
      \ nnoremap <Space>yb m'ggVGy<C-O>

Shortcut close all buffers
      \ nnoremap <silent> <Space>Db :1,999bdelete<CR>

Shortcut strip trailing whitespace in buffer
      \ nnoremap <silent> <Space>d$ :call StripTrailingWhitespace()<CR>

Shortcut strip trailing whitespace in buffer and write buffer to file
      \ nnoremap <silent> <C-S> :call StripTrailingWhitespace()<Bar>write<CR>
      \|nnoremap <silent> <Space>wb :call StripTrailingWhitespace()<Bar>write<CR>

" call shortcut#map('<Space> d b', 'Buffer -> Close')
" function! Shortcut_buffer_close() abort
  " let buffer = bufnr('%')
  " bprevious
  " execute 'bdelete' buffer
" endfunction
