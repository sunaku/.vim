" Names of extensions to be installed (if they aren't already).
let g:coc_global_extensions = []

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[w` and `]w` to navigate diagnostics
Shortcut (Coc) Go to previous diagnostic callout.
      \ nmap <silent> [w <Plug>(coc-diagnostic-prev)
Shortcut (Coc) Go to next diagnostic callout.
      \ nmap <silent> ]w <Plug>(coc-diagnostic-next)

" Remap keys for gotos
Shortcut (Coc) Open the definition of the symbol under the cursor.
      \ nmap <silent> <Leader>gd <Plug>(coc-definition)
Shortcut (Coc) Open the type definition of the symbol under the cursor.
      \ nmap <silent> <Leader>gy <Plug>(coc-type-definition)
Shortcut (Coc) Open the implementation of the symbol under the cursor.
      \ nmap <silent> <Leader>gi <Plug>(coc-implementation)
Shortcut (Coc) Open the references of the symbol under the cursor.
      \ nmap <silent> <Leader>gR <Plug>(coc-references)

" Use K to show documentation in preview window
Shortcut! K (Coc) Open the documentation of the symbol under the cursor.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if index(['vim','help'], &filetype) >= 0
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
Shortcut (Coc) Rename the symbol under the cursor.
      \ nmap <Space>qn <Plug>(coc-rename)

" Remap for format selected region
Shortcut (Coc) Format the selected region of code.
      \ xmap <Space>qv  <Plug>(coc-format-selected)
      \|nmap <Space>qv  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
Shortcut (Coc) Perform codeAction of selected region.
      \ xmap <Space>qa  <Plug>(coc-codeaction-selected)
      \|nmap <Space>qa  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
Shortcut (Coc) Perform codeAction of selected region.
      \ nmap <Space>qa  <Plug>(coc-codeaction)
" Fix autofix problem of current line
Shortcut (Coc) Perform autofix of issue at cursor line.
      \ nmap <Space>qf  <Plug>(coc-fix-current)

" XXX: this breaks <C-I> in normal mode
" " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" NOTE: these are handled by clap plugin configuration bundle/finder/clap.vim
" Shortcut (Coc) Show all diagnostics
"       \ nnoremap <silent> <space>qd  :<C-u>CocList diagnostics<cr>
" Shortcut (Coc) Manage extensions
"       \ nnoremap <silent> <space>qe  :<C-u>CocList extensions<cr>
" Shortcut (Coc) Show commands
"       \ nnoremap <silent> <space>qc  :<C-u>CocList commands<cr>
" Shortcut (Coc) Find symbol of current document
"       \ nnoremap <silent> <space>qo  :<C-u>CocList outline<cr>
" Shortcut (Coc) Search workspace symbols
"       \ nnoremap <silent> <space>qs  :<C-u>CocList -I symbols<cr>
Shortcut (Coc) Do default action for next item.
      \ nnoremap <silent> <space>qj  :<C-u>CocNext<CR>
Shortcut (Coc) Do default action for previous item.
      \ nnoremap <silent> <space>qk  :<C-u>CocPrev<CR>
Shortcut (Coc) Resume latest coc list
      \ nnoremap <silent> <space>qp  :<C-u>CocListResume<CR>

"-----------------------------------------------------------------------------
" :CocInstall coc-snippets
"-----------------------------------------------------------------------------
let g:coc_global_extensions += ['coc-snippets']

Shortcut! <C-J> (Coc) Jump to next placeholder in snippet expansion.
Shortcut! <C-K> (Coc) Jump to previous placeholder in snippet expansion.

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

"-----------------------------------------------------------------------------
" :CocInstall coc-marketplace
"-----------------------------------------------------------------------------
let g:coc_global_extensions += ['coc-marketplace']

Shortcut (coc-marketplace) Show available plugins for installation
      \ nnoremap <silent> <space>qi  :<C-u>CocList marketplace<CR>

"-----------------------------------------------------------------------------
" :CocInstall coc-json
"-----------------------------------------------------------------------------
let g:coc_global_extensions += ['coc-json']

"-----------------------------------------------------------------------------
" :CocInstall coc-emoji
"-----------------------------------------------------------------------------
let g:coc_global_extensions += ['coc-emoji']
