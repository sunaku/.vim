" Names of extensions to be installed (if they aren't already).
let g:coc_global_extensions = []

" don't give |ins-completion-menu| messages.
set shortmess+=c

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[w` and `]w` to navigate diagnostics
Shortcut (Coc) Go to previous diagnostic callout.
      \ nmap <silent><nowait> [w <Plug>(coc-diagnostic-prev)
Shortcut (Coc) Go to next diagnostic callout.
      \ nmap <silent><nowait> ]w <Plug>(coc-diagnostic-next)

" Remap keys for gotos
Shortcut (Coc) Open the definition of the symbol under the cursor.
      \ nmap <silent><nowait> <Leader>gd <Plug>(coc-definition)
Shortcut (Coc) Open the type definition of the symbol under the cursor.
      \ nmap <silent><nowait> <Leader>gy <Plug>(coc-type-definition)
Shortcut (Coc) Open the implementation of the symbol under the cursor.
      \ nmap <silent><nowait> <Leader>gi <Plug>(coc-implementation)
Shortcut (Coc) Open the references of the symbol under the cursor.
      \ nmap <silent><nowait> <Leader>gR <Plug>(coc-references)

" Use K to show documentation in preview window
Shortcut! K (Coc) Open the documentation of the symbol under the cursor.
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

function! s:ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Remap keys for applying refactor code actions
nmap <silent> <leader>qr <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>qr <Plug>(coc-codeaction-refactor-selected)
omap <silent> <leader>qr <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>ql  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" " Use CTRL-S for selections ranges
" " Requires 'textDocument/selectionRange' support of language server
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
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
