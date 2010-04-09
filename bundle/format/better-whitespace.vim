" stripping
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1
let g:strip_only_modified_lines = 1
let g:strip_whitespace_confirm = 0

" highlight
let g:show_spaces_that_precede_tabs = 1

" A less obtrusive color than BRIGHT RED
highlight! link ExtraWhitespace CursorColumn

Shortcut (better-whitespace) strip trailing whitespace in buffer
      \ nnoremap <silent> <Space>d$ :StripWhitespace<CR>

augroup better_whitespace
  autocmd!

  " highlight whitespace in markdown files, though
  " stripping remains disabled by the blacklist
  autocmd FileType markdown EnableWhitespace

  " Do not modify kernel files, even though their type
  " is not blacklisted and highlighting is enabled
  autocmd BufRead /usr/src/linux* DisableStripWhitespaceOnSave

augroup END
