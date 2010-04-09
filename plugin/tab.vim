Shortcut close tab
      \ nnoremap <silent> <Space>dt :tabclose<CR>

Shortcut close other tabs
      \ nnoremap <silent> <Space>Dt :tabonly<CR>

Shortcut expose first tab
      \ nnoremap <silent> 1gt :tabfirst<CR>

for i in range(2,9)
  execute 'Shortcut! '. i .'gt expose tab '. i
endfor

Shortcut expose last tab
      \ nnoremap <silent> 0gt :tablast<CR>

Shortcut expose next tab
      \ nnoremap <silent> <Space>nt :tabnext<CR>
      \|nnoremap <silent> <A-Right> :tabnext<CR>

Shortcut expose previous tab
      \ nnoremap <silent> <Space>Nt :tabprevious<CR>
      \|nnoremap <silent> <A-Left> :tabprevious<CR>

Shortcut move tab to first place
      \ nnoremap <silent> <Space>^t :tabmove 0<CR>

Shortcut move tab to last place
      \ nnoremap <silent> <Space>$t :tabmove $<CR>

Shortcut move tab left
      \ nnoremap <silent> <Space><t :tabmove -1<CR>

Shortcut move tab right
      \ nnoremap <silent> <Space>>t :tabmove +1<CR>

Shortcut insert new tab in first place
      \ nnoremap <silent> <Space>It :0tabnew<CR>

Shortcut append new tab in last place
      \ nnoremap <silent> <Space>At :$tabnew<CR>

Shortcut insert new tab
      \ nnoremap <silent> <Space>it :-tabnew<CR>

Shortcut append new tab
      \ nnoremap <silent> <Space>at :tabnew<CR>
