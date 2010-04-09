"-----------------------------------------------------------------------------
" NEXT AND PREVIOUS                               *unimpaired-next*
"-----------------------------------------------------------------------------

Shortcut! [a       (unimpaired) go to previous argument
Shortcut! ]a       (unimpaired) go to next     argument
Shortcut! [A       (unimpaired) go to first    argument
Shortcut! ]A       (unimpaired) go to last     argument
Shortcut! [b       (unimpaired) go to previous buffer
Shortcut! ]b       (unimpaired) go to next     buffer
Shortcut! [B       (unimpaired) go to first    buffer
Shortcut! ]B       (unimpaired) go to last     buffer
Shortcut! [l       (unimpaired) go to previous location
Shortcut! ]l       (unimpaired) go to next     location
Shortcut! [L       (unimpaired) go to first    location
Shortcut! ]L       (unimpaired) go to last     location
Shortcut! [<C-L>   (unimpaired) go to previous file with locations
Shortcut! ]<C-L>   (unimpaired) go to next     file with locations
Shortcut! [q       (unimpaired) go to previous quickfix
Shortcut! ]q       (unimpaired) go to next     quickfix
Shortcut! [Q       (unimpaired) go to first    quickfix
Shortcut! ]Q       (unimpaired) go to last     quickfix
Shortcut! [<C-Q>   (unimpaired) go to previous file with quickfixes
Shortcut! ]<C-Q>   (unimpaired) go to next     file with quickfixes
Shortcut! [t       (unimpaired) go to previous ctag
Shortcut! ]t       (unimpaired) go to next     ctag
Shortcut! [T       (unimpaired) go to first    ctag
Shortcut! ]T       (unimpaired) go to last     ctag

Shortcut! [f       (unimpaired) go to previous file in current file's directory
Shortcut! ]f       (unimpaired) go to next     file in current file's directory

Shortcut! [n       (unimpaired) go to previous conflict marker or diff/patch hunk
Shortcut! ]n       (unimpaired) go to next     conflict marker or diff/patch hunk

"-----------------------------------------------------------------------------
" LINE OPERATIONS                                 *unimpaired-lines*
"-----------------------------------------------------------------------------

Shortcut! [<Space> (unimpaired) Add [count] blank lines above the cursor.
Shortcut! ]<Space> (unimpaired) Add [count] blank lines below the cursor.

Shortcut! [e       (unimpaired) Exchange current line with [count] lines above it.
Shortcut! ]e       (unimpaired) Exchange current line with [count] lines below it.

"-----------------------------------------------------------------------------
" OPTION TOGGLING                                 *unimpaired-toggling*
"-----------------------------------------------------------------------------

function! s:describe_option_shortcuts(key, description) abort
  execute 'Shortcut! [o'. a:key .' (unimpaired) enable '.  a:description
  execute 'Shortcut! ]o'. a:key .' (unimpaired) disable '. a:description
  execute 'Shortcut! co'. a:key .' (unimpaired) toggle '.  a:description
endfunction

call s:describe_option_shortcuts('b', "assuming light background")
call s:describe_option_shortcuts('c', "highlighting cursor's line")
call s:describe_option_shortcuts('d', "diffing with current buffer")
call s:describe_option_shortcuts('h', "highlighting search results")
call s:describe_option_shortcuts('i', "ignoring case sensitivity")
call s:describe_option_shortcuts('l', "listing nonprintable characters")
call s:describe_option_shortcuts('n', "absolute line numbering")
call s:describe_option_shortcuts('r', "relative line numbering")
call s:describe_option_shortcuts('s', "checking for misspelled words")
call s:describe_option_shortcuts('u', "highlighting cursor's column")
call s:describe_option_shortcuts('v', "constraining cursor to line")
call s:describe_option_shortcuts('w', "wrapping very long lines")
call s:describe_option_shortcuts('x', "highlighting cursor's position")

"-----------------------------------------------------------------------------
" PASTING                                         *unimpaired-pasting*
"-----------------------------------------------------------------------------

Shortcut! >p       (unimpaired) Paste after  cursor, linewise, increasing indent.
Shortcut! >P       (unimpaired) Paste before cursor, linewise, increasing indent.
Shortcut! <p       (unimpaired) Paste after  cursor, linewise, decreasing indent.
Shortcut! <P       (unimpaired) Paste before cursor, linewise, decreasing indent.
Shortcut! =p       (unimpaired) Paste after  cursor, linewise, reindenting.
Shortcut! =P       (unimpaired) Paste before cursor, linewise, reindenting.

Shortcut! [p       (unimpaired) Paste after  cursor, linewise.
Shortcut! ]p       (unimpaired) Paste before cursor, linewise.

Shortcut! yo       (unimpaired) Paste after  cursor, linewise, using set 'paste'.
Shortcut! yO       (unimpaired) Paste before cursor, linewise, using set 'paste'.

"-----------------------------------------------------------------------------
" ENCODING AND DECODING                           *unimpaired-encoding*
"-----------------------------------------------------------------------------

Shortcut! [x       (unimpaired) XML escape.
Shortcut! ]x       (unimpaired) XML unescape.
Shortcut! [xx      (unimpaired) XML escape current line.
Shortcut! ]xx      (unimpaired) XML unescape current line.

Shortcut! [u       (unimpaired) URL escape.
Shortcut! ]u       (unimpaired) URL unescape.
Shortcut! [uu      (unimpaired) URL escape current line.
Shortcut! ]uu      (unimpaired) URL unescape current line.

Shortcut! [y       (unimpaired) String escape.
Shortcut! ]y       (unimpaired) String unescape.
Shortcut! [yy      (unimpaired) String escape current line.
Shortcut! ]yy      (unimpaired) String unescape current line.
