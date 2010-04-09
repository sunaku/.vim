set smarttab         " <Tab> indents with &shiftwidth
set autoindent       " automatically indent new lines
set formatoptions+=c " automatically wrap comment lines
set formatoptions+=n " automatically indent numbered lists
set formatoptions+=o " continue comment marker in new lines
set formatoptions+=j " delete comment character when joining
set textwidth=78     " hard-wrap long lines as you type them
set tabstop=8        " render TABs using this many spaces
set expandtab        " insert spaces when TAB is pressed
set softtabstop=2    " ... this many spaces
set shiftwidth=2     " indentation amount for < and > commands
set nrformats-=octal " no octal numbering for <C-A> and <C-X>

nnoremap Q gqip
vnoremap Q gq
onoremap Q gq

Shortcut indent with tabs in buffer
      \ nnoremap <silent> <Space>f<Tab> :call Format_tabs_indentation()<CR>

Shortcut indent with spaces in buffer
      \ nnoremap <silent> <Space>f<Space> :call Format_spaces_indentation()<CR>

Shortcut format as markdown title heading <h1>
      \ noremap <silent> <Space>f1 :call Format_markdown_title()<CR>

Shortcut format as markdown section heading <h2>
      \ noremap <silent> <Space>f2 :call Format_markdown_section()<CR>

Shortcut format as markdown table heading <th>
      \ noremap <silent> <Space>ft :call Format_markdown_table_header()<CR>

Shortcut format as markdown fenced code block
      \ nnoremap <silent> <Space>fc V:<C-U>call Format_markdown_fenced_code()<CR>
      \|vnoremap <silent> <Space>fc :<C-U>call Format_markdown_fenced_code()<CR>

Shortcut format as separator, appending equal signs to end of line
      \ nnoremap <silent> <Space>f= :call Format_separator_equal_sign()<CR>

Shortcut format as separator, appending minus signs to end of line
      \ nnoremap <silent> <Space>f- :call Format_separator_minus_sign()<CR>

Shortcut format as separator, repeating last character to end of line
      \ nnoremap <silent> <Space>f_ :call Format_separator_repeat_eol()<CR>

Shortcut format function call, adding parentheses
      \ nnoremap <silent> <Space>f) :call Format_funcall_add_parens(0)<CR>
      \|vnoremap <silent> <Space>f) :<C-U>call Format_funcall_add_parens(1)<CR>

Shortcut format function call, removing parentheses
      \ noremap <silent> <Space>f( :call Format_funcall_drop_parens()<CR>

Shortcut convert double to single quotes at cursor
      \ nnoremap <silent> <Space>f' :call Format_quotes_singularize()<CR>

Shortcut convert single to double quotes at cursor
      \ nnoremap <silent> <Space>f" :call Format_quotes_pluralize()<CR>

Shortcut format ruby quotes to symbol at cursor
      \ nnoremap <silent> <Space>f: :call Format_ruby_quotes_to_symbol()<CR>

Shortcut format ruby symbol to quotes at cursor
      \ nnoremap <silent> <Space>f; :call Format_ruby_symbol_to_quotes()<CR>

Shortcut format elixir function call to pipeline at cursor
      \ nnoremap <silent> <Space>fP :call Format_elixir_funcall_to_pipeline()<CR>

Shortcut format elixir pipeline to function call at cursor
      \ nnoremap <silent> <Space>fp :call Format_elixir_pipeline_to_funcall()<CR>

Shortcut format elixir pipeline at cursor: join into a single line
      \ nnoremap <silent> <Space>fJ :call Format_elixir_join_pipeline(0)<CR>
      \|vnoremap <silent> <Space>fJ :<C-U>call Format_elixir_join_pipeline(1)<CR>

Shortcut format elixir pipeline at cursor: split into multiple lines
      \ nnoremap <silent> <Space>fK :call Format_elixir_split_pipeline(0)<CR>
      \|vnoremap <silent> <Space>fK :<C-U>call Format_elixir_split_pipeline(1)<CR>

" automatically adjust indentation style based on the buffer we are editing
autocmd BufReadPost * call Format_automatic_indentation()
function! Format_automatic_indentation()
  if search('^\t\+ *\S', 'ncw')
    call Format_tabs_indentation()
  else
    call Format_spaces_indentation()
  endif
endfunction

function! Format_tabs_indentation() abort
  setlocal noexpandtab softtabstop=8 shiftwidth=8
endfunction

function! Format_spaces_indentation() abort
  setlocal expandtab softtabstop=2 shiftwidth=2
endfunction

" format current line as a top-level heading in Markdown
" yyp:s/^\s*//<CR>Vr===:.+g/^\s*=\+\s*/d
function! Format_markdown_title() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  keeppatterns s/^\s*//

  " make all characters "=" in separator line
  normal! Vr=

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  keeppatterns .+g/^\s*=\+\s*/d

  call winrestview(cursor)
endfunction

" format current line as a second-level heading in Markdown
" yyp:s/^\s*//<CR>Vr-==:.+g/^\s*-\+\s*/d
function! Format_markdown_section() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  keeppatterns s/^\s*//

  " make all characters "-" in separator line
  normal! Vr-

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  keeppatterns .+g/^\s*-\+\s*/d

  call winrestview(cursor)
endfunction

" format current line as table/body separator in Markdown (uses `z marker)
function! Format_markdown_table_header() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  left

  " make all characters "-" and "|" in separator line
  keeppatterns s/[^|]/-/g
  keeppatterns s/-|/ |/g
  keeppatterns s/|-/| /g

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  keeppatterns .+g/^\s*[|-]\+\s*/d

  call winrestview(cursor)
endfunction

" format selected Markdown indented code block into a fenced code block
" 2<']o<Esc>3i`<Esc>yy<C-O>PA
function! Format_markdown_fenced_code() abort
  " remove markdown's 4-space indent for code blocks
  keeppatterns silent! '<,'>s/^ \{4}//

  " add a fence at bottom of code block
  normal! '>o
  normal! 3i`

  " add a fence at top of code block
  normal! yy'<P

  " enter insert mode to specify code block language
  startinsert!
endfunction

" insert or update section separator at end of current line
function! Format_separator_equal_sign() abort
  normal! A=
  call Format_separator_repeat_eol()
endfunction

" insert or update section separator at end of current line
function! Format_separator_minus_sign() abort
  normal! A-
  call Format_separator_repeat_eol()
endfunction

" repeat last character to the maximum width of current line
function! Format_separator_repeat_eol() abort
  keeppatterns execute 's/.$/'. repeat('&', &textwidth+1) .'/'
  keeppatterns execute 's/\%>'. &textwidth .'v.//g'
endfunction

let s:insert_surround = "\<Plug>(operator-sandwich-add)"
let s:change_surround = "\<Plug>(operator-sandwich-replace)\<Plug>(operator-sandwich-release-count)\<Plug>(textobj-sandwich-query-a)"
let s:delete_surround = "\<Plug>(operator-sandwich-delete)\<Plug>(operator-sandwich-release-count)\<Plug>(textobj-sandwich-query-a)"

" surround function call arguments with parentheses
function! Format_funcall_add_parens(visual) abort
  let cursor = winsaveview()

  if !a:visual
    " select WORD under cursor
    normal! viW

    " extend back to any comma
    normal! o
    call search('[^(]\s\+\zs[^,]\+,', 'bcz')
  endif

  " surround the visual selection with parentheses
  execute 'normal '. s:insert_surround .'('

  call winrestview(cursor)
endfunction

" remove parentheses around function call arguments
function! Format_funcall_drop_parens() abort
  let cursor = winsaveview()
  execute 'normal '. s:delete_surround .'('
  execute 'normal! i '
  call winrestview(cursor)
endfunction

" convert from double quotes to single quotes
function! Format_quotes_singularize() abort
  let cursor = winsaveview()
  execute 'normal '. s:change_surround ."\"'"
  call winrestview(cursor)
endfunction

" convert from single quotes to double quotes
function! Format_quotes_pluralize() abort
  let cursor = winsaveview()
  execute 'normal '. s:change_surround ."'\""
  call winrestview(cursor)
endfunction

" convert from single quotes to Ruby symbol notation
function! Format_ruby_quotes_to_symbol() abort
  let cursor = winsaveview()
  execute 'normal '. s:delete_surround ."'"
  normal! i:
  call winrestview(cursor)
endfunction

" convert from Ruby symbol notation to single quotes
function! Format_ruby_symbol_to_quotes() abort
  let cursor = winsaveview()
  normal! F:xve
  execute 'normal '. s:insert_surround ."'"
  call winrestview(cursor)
endfunction

" extract Elixir function call argument into a pipeline
function! Format_elixir_funcall_to_pipeline() abort
  let cursor = winsaveview()

  " go to beginning of argument list
  normal! da(u

  " extract the very first argument
  " https://github.com/wellle/targets.vim
  normal daa

  " pipeline it into the function call
  execute "normal! BPa |> "

  " delete any comma that came with it
  normal! Bge
  keeppatterns silent! execute 's/\%' . col('.') . 'c,\s*/ /'

  " delete leftover empty parentheses
  " NOTE: Elixir 1.6 discourages this
  " keeppatterns silent! execute 's/\%>' . col('.') . 'c(\s*)//'

  call winrestview(cursor)
endfunction

" convert Elixir pipeline into a function call argument
function! Format_elixir_pipeline_to_funcall() abort
  let cursor = winsaveview()

  " find nearest pipeline operator
  if search('|>', 'c', line('.')) || search('|>', 'cb', line('.'))
    " delete the pipeline operator
    normal! dw

    " delete space before operator
    normal! geldw

    " extract the pipeline stage
    if search('|>\s*', 'bse', line('.'))
      normal! ld`'
    else
      normal! dB
    endif

    " look for next pipeline stage
    if search('|>', 'c', line('.'))
      normal! ge
    elseif search('([^)]', '', line('.'))
      " argument list already exists
      execute 'normal! a, '
      normal! b
    else
      normal! E
    endif

    if search('\%' . col('.') .'c(', 'cn', line('.'))
      " argument list already exists
      normal! p
    elseif search('\%' . col('.') .'c,', 'cn', line('.'))
      " argument list already exists
      normal! bp
    else
      " make brand new argument list
      normal! a()
      normal! P
    endif

    " merge with existing argument list
    if search(')(', 'be', line('.'))
      " extract new argument list
      normal! da)

      " prepend before old list
      call search(')', 'cb', line('.'))
      normal! %P

      " combine new & old lists
      normal! df(

      " add comma after new list
      if !search('\%' . col('.') .'c)', 'cn', line('.'))
        execute 'normal! i, '
      endif
    endif
  endif

  call winrestview(cursor)
endfunction

" join Elixir pipeline stages from multiple lines into a single line
function! Format_elixir_join_pipeline(visual) abort
  let cursor = winsaveview()

  " operate on current paragraph by default
  if !a:visual
    normal! vip
  endif

  " join lines broken on pipeline operators
  keeppatterns silent! '<,'>s/\s*\n\s*\ze|>/ /
  normal! :

  call winrestview(cursor)
endfunction

" split Elixir pipeline from a single line into multiple stage lines
function! Format_elixir_split_pipeline(visual) abort
  let cursor = winsaveview()

  " operate on current paragraph by default
  if !a:visual
    normal! vip
  endif

  " break pipeline operators onto new lines
  keeppatterns silent! '<,'>s/\ze|>/\r/g
  normal! =

  call winrestview(cursor)
endfunction
