set splitright " focus new window after vertical splitting
set splitbelow " focus new window after horizontal splitting

Shortcut split window above
      \ nnoremap <silent> <Space>Ow :aboveleft split<CR>

Shortcut split window below
      \ nnoremap <silent> <Space>ow :belowright split<CR>

Shortcut split window left
      \ nnoremap <silent> <Space>iw :aboveleft vsplit<CR>

Shortcut split window right
      \ nnoremap <silent> <Space>aw :belowright vsplit<CR>

Shortcut close window
      \ nnoremap <silent> <Space>dw :close<CR>

Shortcut close other windows
      \ nnoremap <silent> <Space>Dw :only<CR>

Shortcut minimum window size
      \ nnoremap <silent> <Space>0w :resize 1<Bar>vertical resize 1<CR>

Shortcut maximum window size
      \ nnoremap <silent> <Space>1w :resize<Bar>vertical resize<CR>

" max out before equalizing to accomodate changes in screen resolution
Shortcut equal window sizes
      \ nnoremap <silent> <Space>=w :resize<Bar>vertical resize<Bar>wincmd =<CR>

Shortcut minimum window height
      \ nnoremap <silent> <Leader><S-Down> :resize 1<CR>

Shortcut minimum window width
      \ nnoremap <silent> <Leader><S-Left> :vertical resize 1<CR>

Shortcut decrease window size
      \ nnoremap <silent> <Space>-w :<C-U>execute join(repeat(['resize -1', 'vertical resize -1'], v:count1), '<Bar>')<CR>

Shortcut decrease window height
      \ nnoremap <silent> <S-Down> :resize -1<CR>

Shortcut decrease window width
      \ nnoremap <silent> <S-Left> :vertical resize -1<CR>

Shortcut increase window size
      \ nnoremap <silent> <Space>+w :<C-U>execute join(repeat(['resize +1', 'vertical resize +1'], v:count1), '<Bar>')<CR>

Shortcut increase window height
      \ nnoremap <silent> <S-Up> :resize +1<CR>

Shortcut increase window width
      \ nnoremap <silent> <S-Right> :vertical resize +1<CR>

Shortcut maximum window height
      \ nnoremap <silent> <Leader><S-Up> :resize<CR>

Shortcut maximum window width
      \ nnoremap <silent> <Leader><S-Right> :vertical resize<CR>
