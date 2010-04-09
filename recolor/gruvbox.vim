" make line numbers blend in
highlight LineNr ctermfg=239 guifg=#504945

" make current window's statusline stand out
highlight! link StatusLine PmenuThumb

" make TODO keywords stand out
highlight Todo ctermfg=224

" make comments stand out more
" highlight Comment ctermfg=102
" highlight Comment ctermfg=145
highlight Comment ctermfg=146

" make spelling errors stand out
highlight SpellBad   ctermbg=89 guibg=#87005f
highlight SpellCap   ctermbg=55 guibg=#5f00af
highlight SpellLocal ctermbg=26 guibg=#005fdf
highlight SpellRare  ctermbg=28 guibg=#008700

" differentiate Search from DiffText
highlight IncSearch cterm=none ctermfg=214 ctermbg=130 gui=none guifg=#fabd2f guibg=#9d0006
highlight Search    term=none  ctermfg=214 ctermbg=96  gui=none guifg=#fabd2f guibg=#8f3f71

" unite.vim search candidate highlighting
highlight link uniteCandidateInputKeyword MoreMsg

" NeoVim :terminal integration
let g:terminal_color_0  = '#1d2021' " dark0_hard
let g:terminal_color_1  = '#fb4934' " bright_red
let g:terminal_color_2  = '#b8bb26' " bright_green
let g:terminal_color_3  = '#fabd2f' " bright_yellow
let g:terminal_color_4  = '#83a598' " bright_blue
let g:terminal_color_5  = '#d3869b' " bright_purple
let g:terminal_color_6  = '#8ec07c' " bright_aqua
let g:terminal_color_7  = '#ebdbb2' " light1
let g:terminal_color_8  = '#1d2021' " dark0_hard
let g:terminal_color_9  = '#fb4934' " bright_red
let g:terminal_color_10 = '#b8bb26' " bright_green
let g:terminal_color_11 = '#fabd2f' " bright_yellow
let g:terminal_color_12 = '#83a598' " bright_blue
let g:terminal_color_13 = '#d3869b' " bright_purple
let g:terminal_color_14 = '#8ec07c' " bright_aqua
let g:terminal_color_15 = '#ebdbb2' " light1
highlight TermCursor ctermfg=208 guifg=#fe8019
highlight TermCursorNC cterm=reverse ctermfg=136 gui=reverse guifg=#b57614

" LimeLight integration
let g:limelight_conceal_ctermfg = 241

" FZF integration
let g:fzf_colors =
\ { 'fg':      ['fg', 'Pmenu'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Identifier'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Search'],
  \ 'info':    ['fg', 'Type'],
  \ 'prompt':  ['fg', 'Title'],
  \ 'pointer': ['fg', 'Constant'],
  \ 'marker':  ['fg', 'Special'],
  \ 'spinner': ['fg', 'Keyword'],
  \ 'header':  ['fg', 'Comment'] }
