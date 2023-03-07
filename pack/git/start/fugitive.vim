set statusline+=\ %{substitute(fugitive#statusline(),'^.Git.\\(.*\\)..$','\\1','')}

" https://github.com/tpope/vim-fugitive/pull/90
autocmd QuickFixCmdPost *grep* cwindow

Shortcut (fugitive) git grep: search repository
      \ nnoremap <silent> <Space>/G :<C-U>call <SID>git_grep_prompt('-Pi')<CR>
      \|nnoremap <silent> <Space>/g :<C-U>call <SID>git_grep_prompt('-P')<CR>

Shortcut (fugitive) git grep: search repository for Vim search pattern
      \ nnoremap <silent> <Space>?G :<C-U>call <SID>git_grep_register('-Pi')<CR>
      \|nnoremap <silent> <Space>?g :<C-U>call <SID>git_grep_register('-P')<CR>

Shortcut (fugitive) git grep: search repository for word under cursor
      \ nnoremap <silent> <Space>*G :<C-U>call <SID>git_grep_cursor('-Pi')<CR>
      \|nnoremap <silent> <Space>*g :<C-U>call <SID>git_grep_cursor('-P')<CR>

function! s:git_grep_prompt(git_grep_flags) abort
  " store cursor position in jumplist so user can press <C-O> to go back
  silent! normal! m'n`'
  let grep_regex = input("git grep ". a:git_grep_flags." ")
  call s:git_grep(a:git_grep_flags, grep_regex)
endfunction

function! s:git_grep_cursor(git_grep_flags) abort
  let grep_regex = expand('<cword>')
  call s:git_grep(a:git_grep_flags, grep_regex)
endfunction

function! s:git_grep_register(git_grep_flags) abort
  let vim_regex = @/
  let grep_regex = substitute(grep_regex, '\\[vVmM]', '', 'g') " :help /magic
  let grep_regex = substitute(grep_regex, '\\[<>]', '\\b', 'g') " word boundary
  call s:git_grep(a:git_grep_flags, grep_regex)
endfunction

function! s:git_grep(git_grep_flags, grep_regex) abort
  -tabnew
  execute 'Ggrep --quiet '. a:git_grep_flags .' '. fnameescape(a:grep_regex)
  " translate grep(1) regex into Vim syntax; see :help eregex-functions
  let vim_regex = E2v(a:grep_regex)
  " E2v() won't handle \b - https://github.com/othree/eregex.vim/issues/28
  let vim_regex = substitute(vim_regex, '\\b', '\\(\\<\\|\\>\\)', 'g')
  let @/ = vim_regex
endfunction

Shortcut (fugitive) git mv: rename file
      \ nnoremap <silent> <Space>cg :call feedkeys(':GMove '.expand('%'), 't')<CR>

Shortcut (fugitive) git mv -f: rename file forcefully
      \ nnoremap <silent> <Space>Cg :call feedkeys(':GMove! '.expand('%'), 't')<CR>

Shortcut (fugitive) git blame: who changed which line
      \ nnoremap <silent> <Space>GG :Git blame<CR>

Shortcut (fugitive) git commit: record new commit
      \ nnoremap <silent> <Space>ig :Git commit<CR>

Shortcut (fugitive) git commit --amend
      \ nnoremap <silent> <Space>ag :Git commit --amend<CR>

Shortcut (fugitive) git commit --amend --reuse-message=HEAD
      \ nnoremap <silent> <Space>Ag :Git commit --amend --reuse-message=HEAD<CR>

Shortcut (fugitive) git diff: show changes against repository
      \ nnoremap <silent> <Space>hg :Gdiffsplit<CR>

Shortcut (fugitive) return to editing git buffer
      \ nnoremap <silent> <Space>eG :Gedit<CR>

Shortcut (fugitive) git checkout: revert buffer to repository
      \ nnoremap <silent> <Space>rg :Gread<CR>

Shortcut (fugitive) git checkout -f: revert buffer to repository forcefully
      \ nnoremap <silent> <Space>Rg :Gread!<CR>

Shortcut (fugitive) open git status window
      \ nnoremap <silent> <Space>gg :Gstatus<CR>

Shortcut (fugitive) git add: stage all changes in buffer
      \ nnoremap <silent> <Space>wg :Gwrite<CR>

Shortcut (fugitive) git add -f: stage all changes in buffer forcefully
      \ nnoremap <silent> <Space>Wg :Gwrite!<CR>

Shortcut (fugitive) git rm: delete file from repository
      \ nnoremap <silent> <Space>dg :GRemove<Bar>bdelete<CR>

Shortcut (fugitive) git rm -f: delete file from repository forcefully
      \ nnoremap <silent> <Space>Dg :GRemove!<Bar>bdelete<CR>
