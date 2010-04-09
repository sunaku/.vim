set statusline+=\ %{substitute(fugitive#statusline(),'^.Git.\\(.*\\)..$','\\1','')}

" https://github.com/tpope/vim-fugitive/pull/90
autocmd QuickFixCmdPost *grep* cwindow

Shortcut (fugitive) git grep: search repository
      \ nnoremap <Space>/g :tabnew .git <Bar> silent Ggrep ''<Left>
      \|nnoremap <Space>/G :tabnew .git <Bar> silent Ggrep -i ''<Left>

Shortcut (fugitive) git mv: rename file
      \ nnoremap <silent> <Space>cg :call feedkeys(':Gmove '.expand('%'), 't')<CR>

Shortcut (fugitive) git mv -f: rename file forcefully
      \ nnoremap <silent> <Space>Cg :call feedkeys(':Gmove! '.expand('%'), 't')<CR>

Shortcut (fugitive) git blame: who changed which line
      \ nnoremap <silent> <Space>EG :Gblame<CR>

Shortcut (fugitive) git commit: record new commit
      \ nnoremap <silent> <Space>ag :Gcommit<CR>

Shortcut (fugitive) git commit --amend
      \ nnoremap <silent> <Space>Ag :Gcommit --amend<CR>

Shortcut (fugitive) git diff: show changes against repository
      \ nnoremap <silent> <Space>hg :Gdiff<CR>

Shortcut (fugitive) return to editing git buffer
      \ nnoremap <silent> <Space>Og :Gedit<CR>

Shortcut (fugitive) git checkout: revert buffer to repository
      \ nnoremap <silent> <Space>rg :Gread<CR>

Shortcut (fugitive) git checkout -f: revert buffer to repository forcefully
      \ nnoremap <silent> <Space>Rg :Gread!<CR>

Shortcut (fugitive) open git status window
      \ nnoremap <silent> <Space>OG :Gstatus<CR>

Shortcut (fugitive) git add: stage all changes in buffer
      \ nnoremap <silent> <Space>wg :Gwrite<CR>

Shortcut (fugitive) git add -f: stage all changes in buffer forcefully
      \ nnoremap <silent> <Space>Wg :Gwrite!<CR>

Shortcut (fugitive) git rm: delete file from repository
      \ nnoremap <silent> <Space>dg :Gremove<Bar>bdelete<CR>

Shortcut (fugitive) git rm -f: delete file from repository forcefully
      \ nnoremap <silent> <Space>Dg :Gremove!<Bar>bdelete<CR>
