nnoremap Q gqip
vnoremap Q gq
onoremap Q gq

call shortcut#map('<Space> h <Tab>', 'Format -> Indent -> Tabs')
call shortcut#map('<Space> h <Space>', 'Format -> Indent -> Spaces')
call shortcut#map('<Space> h 1', 'Format -> Markdown -> Title')
call shortcut#map('<Space> h 2', 'Format -> Markdown -> Section')
call shortcut#map('<Space> h t', 'Format -> Markdown -> Table header')
call shortcut#map('<Space> h c', 'Format -> Markdown -> Fenced code block')
call shortcut#map('<Space> h =', 'Format -> Separator -> Using equal sign')
call shortcut#map('<Space> h -', 'Format -> Separator -> Using minus sign')
call shortcut#map('<Space> h .', 'Format -> Separator -> Repeat .$ to EOL')
call shortcut#map('<Space> h a', 'Format -> Arguments', 'ArgWrap')
call shortcut#map('<Space> h s', 'Format -> Delimiters', 'Switch')
call shortcut#map('<Space> h )', 'Format -> Delimiters -> Add funcall parens')
call shortcut#map('<Space> h (', 'Format -> Delimiters -> Drop funcall parens')
call shortcut#map("<Space> h '", 'Format -> Quotes -> Double to single')
call shortcut#map('<Space> h "', 'Format -> Quotes -> Single to double')
call shortcut#map('<Space> h :', 'Format -> Ruby -> Quotes to symbol')
call shortcut#map('<Space> h ;', 'Format -> Ruby -> Symbol to quotes')
call shortcut#map('<Space> h P', 'Format -> Elixir -> Funcall to pipeline')
call shortcut#map('<Space> h p', 'Format -> Elixir -> Pipeline to funcall')
call shortcut#map('<Space> h J', 'Format -> Elixir -> Join pipeline')
call shortcut#map('<Space> h j', 'Format -> Elixir -> Split pipeline')

" automatically adjust indentation style based on the buffer we are editing
autocmd BufReadPost * call s:DetectIndentationStyle()
function! s:DetectIndentationStyle()
  if search('^\t\+ *\S', 'ncw')
    call Shortcut_format_indent_tabs()
  else
    call Shortcut_format_indent_spaces()
  endif
endfunction

function! Shortcut_format_indent_tabs() abort
  setlocal noexpandtab softtabstop=8 shiftwidth=8
endfunction

function! Shortcut_format_indent_spaces() abort
  setlocal expandtab softtabstop=2 shiftwidth=2
endfunction

" format current line as a top-level heading in Markdown
" yyp:s/^\s*//<Return>Vr===:.+g/^\s*=\+\s*/d
function! Shortcut_format_markdown_title() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  s/^\s*//

  " make all characters "=" in separator line
  normal! Vr=

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  .+g/^\s*=\+\s*/d

  call winrestview(cursor)
endfunction

" format current line as a second-level heading in Markdown
" yyp:s/^\s*//<Return>Vr-==:.+g/^\s*-\+\s*/d
function! Shortcut_format_markdown_section() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  s/^\s*//

  " make all characters "-" in separator line
  normal! Vr-

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  .+g/^\s*-\+\s*/d

  call winrestview(cursor)
endfunction

" format current line as table/body separator in Markdown (uses `z marker)
function! Shortcut_format_markdown_table_header() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  left

  " make all characters "-" and "|" in separator line
  s/[^|]/-/g
  s/-|/ |/g
  s/|-/| /g

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  .+g/^\s*[|-]\+\s*/d

  call winrestview(cursor)
endfunction

" format selected Markdown indented code block into a fenced code block
" 2<']o<Esc>3i`<Esc>yy<C-O>PA
function! Shortcut_format_markdown_fenced_code_block() abort
  if shortcut#mode() == 'n'
    normal! V
  endif
  normal! 2<'>2o
  normal! 3i`
  normal! kddyy'<P$
endfunction

" insert or update section separator at end of current line
function! Shortcut_format_separator_using_equal_sign() abort
  normal! A=
  call Shortcut_format_separator_repeat_to_eol()
endfunction

" insert or update section separator at end of current line
function! Shortcut_format_separator_using_minus_sign() abort
  normal! A-
  call Shortcut_format_separator_repeat_to_eol()
endfunction

" repeat last character to the maximum width of current line
function! Shortcut_format_separator_repeat_to_eol() abort
  let last_search_register=@/
  try
    execute 's/.$/'. repeat('&', &textwidth+1) .'/'
    execute 's/\%>'. &textwidth .'v.//g'
  finally
    let @/=last_search_register
  endtry
endfunction

let s:insert_surround = "\<Plug>(operator-sandwich-add)"
let s:change_surround = "\<Plug>(operator-sandwich-replace)\<Plug>(operator-sandwich-release-count)\<Plug>(textobj-sandwich-query-a)"
let s:delete_surround = "\<Plug>(operator-sandwich-delete)\<Plug>(operator-sandwich-release-count)\<Plug>(textobj-sandwich-query-a)"

" surround function call arguments with parentheses
function! Shortcut_format_delimiters_add_funcall_parens() abort
  let cursor = winsaveview()

  if shortcut#mode() == 'n'
    " select WORD under cursor
    normal! viW

    " extend back to any comma
    normal! oF,
  endif

  " surround the visual selection with parentheses
  execute 'normal '. s:insert_surround .'('

  call winrestview(cursor)
endfunction

" remove parentheses around function call arguments
function! Shortcut_format_delimiters_drop_funcall_parens() abort
  let cursor = winsaveview()
  execute 'normal '. s:delete_surround .'('
  execute 'normal! i '
  call winrestview(cursor)
endfunction

" convert from double quotes to single quotes
function! Shortcut_format_quotes_double_to_single() abort
  let cursor = winsaveview()
  execute 'normal '. s:change_surround ."\"'"
  call winrestview(cursor)
endfunction

" convert from single quotes to double quotes
function! Shortcut_format_quotes_single_to_double() abort
  let cursor = winsaveview()
  execute 'normal '. s:change_surround ."'\""
  call winrestview(cursor)
endfunction

" convert from single quotes to Ruby symbol notation
function! Shortcut_format_ruby_quotes_to_symbol() abort
  let cursor = winsaveview()
  execute 'normal '. s:delete_surround ."'"
  normal! i:
  call winrestview(cursor)
endfunction

" convert from Ruby symbol notation to single quotes
function! Shortcut_format_ruby_symbol_to_quotes() abort
  let cursor = winsaveview()
  normal! F:xve
  execute 'normal '. s:insert_surround ."'"
  call winrestview(cursor)
endfunction

" extract Elixir function call argument into a pipeline
function! Shortcut_format_elixir_funcall_to_pipeline() abort
  let cursor = winsaveview()

  " go to beginning of argument list
  normal! %

  " extract the very first argument
  " https://github.com/wellle/targets.vim
  normal daa

  " pipeline it into the function call
  execute "normal! BPa |> "

  " delete any comma that came with it
  normal! Bge
  execute 'silent! s/\%' . col('.') . 'c,\s*/ /'

  " delete leftover empty parentheses
  execute 'silent! s/\%>' . col('.') . 'c(\s*)//'

  call winrestview(cursor)
endfunction

" convert Elixir pipeline into a function call argument
function! Shortcut_format_elixir_pipeline_to_funcall() abort
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
      normal! d^
    endif

    " look for next pipeline stage
    if search('|>', 'c', line('.'))
      normal! ge
    else
      normal! E
    endif

    " create a brand new argument list
    normal! a()
    normal! P

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
function! Shortcut_format_elixir_join_pipeline() abort
  let cursor = winsaveview()

  " operate on current paragraph by default
  if shortcut#mode() == 'n'
    normal! vip
  endif

  " join lines broken on pipeline operators
  silent! '<,'>s/\s*\n\s*\ze|>/ /
  normal! :

  call winrestview(cursor)
endfunction

" split Elixir pipeline from a single line into multiple stage lines
function! Shortcut_format_elixir_split_pipeline() abort
  let cursor = winsaveview()

  " operate on current paragraph by default
  if shortcut#mode() == 'n'
    normal! vip
  endif

  " break pipeline operators onto new lines
  silent! '<,'>s/\ze|>/\r/g
  normal! =

  call winrestview(cursor)
endfunction
