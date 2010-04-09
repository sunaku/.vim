runtime bundle/shortcut/shortcut/plugin/shortcut.vim

Shortcut show shortcut menu and run chosen shortcut
      \ noremap <silent> <Space><Space> :Shortcuts<CR>

Shortcut fallback to shortcut menu on partial entry
      \ noremap <silent> <Space> :Shortcuts<CR>

"-----------------------------------------------------------------------------
" Helper logic for shortcuts cheatsheet in README
"-----------------------------------------------------------------------------

let s:header = 'Shortcut | Description'
let s:border = '-------- | -----------'

function! ShortcutsCheatsheetRefresh() abort
  if search('^'. substitute(s:header, '\s', '&*', 'g') .'$', 'w')
    " refresh shortcut definitions from bundles
    let g:shortcuts_overwrite_warning = 1
    runtime! *bundle/*/*.vim
    unlet g:shortcuts_overwrite_warning

    " replace existing table with updated table
    normal! dip
    normal! k
    call append('.', ShortcutsCheatsheetTable())

    " align columns of the newly inserted table
    normal! vap
    execute "normal 1gl\<Space>"
  endif
endfunction

function! ShortcutsCheatsheetTable() abort
  return extend([s:header, s:border], ShortcutsCheatsheetTableRows())
endfunction

function! ShortcutsCheatsheetTableRows() abort
  return sort(values(map(copy(g:shortcuts), '
        \ "``".  ShortcutsCheatsheetEscape(v:key, 0) ."``".
        \ " | ". ShortcutsCheatsheetEscape(v:val, 1)
        \ ')), 'i')
endfunction

function! ShortcutsCheatsheetEscape(input, escape_xml_tags) abort
  let escaped = substitute(a:input, '|', '\\&',     'g') " table delimiters
  let escaped = substitute(escaped, '`', "&\u200B", 'g') " verbatim codespans
  if a:escape_xml_tags
    let escaped = substitute(escaped, '<.\{-}>', '``&``', 'g') " XML tags
  endif
  return escaped
endfunction
