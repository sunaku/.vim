" Restore cursor position after performing surround operations.
call operator#sandwich#set('all', 'all', 'cursor', 'keep')

"  ____  _                _             _
" / ___|| |__   ___  _ __| |_ ___ _   _| |_ ___
" \___ \| '_ \ / _ \| '__| __/ __| | | | __/ __|
"  ___) | | | | (_) | |  | || (__| |_| | |_\__ \
" |____/|_| |_|\___/|_|   \__\___|\__,_|\__|___/
"
" The following shortcuts are based on "macros/sandwich/keymap/surround.vim";
" the main difference here is that I use "S" instead of "ss" for auto-detect,
" and "gs" instead of "s" for surround, and "." for the sentence text-object.
"
" https://github.com/machakann/vim-sandwich/wiki/Introduce-vim-surround-keymappings

Shortcut! gs  (sandwich) surround selection or specified motion with specified delimiters
Shortcut! gS  (sandwich) surround inside automatic delimiters with specified delimiters
Shortcut! ds  (sandwich) delete specified delimiters surrounding specified motion
Shortcut! dS  (sandwich) delete automatic delimiters surrounding specified motion
Shortcut! cs  (sandwich) change specified delimiters surrounding specified motion
Shortcut! cS  (sandwich) change automatic delimiters surrounding specified motion
Shortcut! vaS (textobj) select around text surrounded by automatic delimiters
Shortcut! viS (textobj) select inside text surrounded by automatic delimiters
Shortcut! vas (textobj) select around text surrounded by specified delimiters
Shortcut! vis (textobj) select inside text surrounded by specified delimiters
Shortcut! va. (textobj) select around sentence
Shortcut! vi. (textobj) select inside sentence

let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

" Delete surround.
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dS <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" Change surround.
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap cS <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" Add surround.
xmap gs <Plug>(operator-sandwich-add)
nmap gs <Plug>(operator-sandwich-add)
nmap gS <Plug>(operator-sandwich-add)<Plug>(textobj-sandwich-auto-i)

" Repeat surround.
runtime autoload/repeat.vim
if hasmapto('<Plug>(RepeatDot)')
  nmap . <Plug>(operator-sandwich-predot)<Plug>(RepeatDot)
else
  nmap . <Plug>(operator-sandwich-dot)
endif

" Textobjects to select the nearest surrounded text automatically.
xmap iS <Plug>(textobj-sandwich-auto-i)
xmap aS <Plug>(textobj-sandwich-auto-a)
omap iS <Plug>(textobj-sandwich-auto-i)
omap aS <Plug>(textobj-sandwich-auto-a)

" Textobjects to select a text surrounded by same characters user input.
xmap is <Plug>(textobj-sandwich-literal-query-i)
xmap as <Plug>(textobj-sandwich-literal-query-a)
omap is <Plug>(textobj-sandwich-literal-query-i)
omap as <Plug>(textobj-sandwich-literal-query-a)

" provide an alternative "." alias to Vim's default "s" sentence textobj
xnoremap a. as
xnoremap i. is
onoremap a. as
onoremap i. is
