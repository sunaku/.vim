" less intense colors in the tabline
highlight! link TabLine StatusLineNC
highlight! link TabLineSel Aqua

" make current window pane more obvious
highlight! link StatusLine Pmenu

" brighter text for current line number
highlight! link CursorLineNr StatusLine

" disable italics (reverse video) for comments
highlight Comment cterm=none gui=none

" make ultrathin fonts easier to see
highlight DiffText gui=bold
highlight IncSearch gui=bold
highlight Search gui=bold

" make TODO legible on DiffText lines
highlight! link Todo QuickFixLine

" FZF integration
let g:fzf_colors = {}
let g:fzf_colors['fg'] = ['fg', 'Comment']
let g:fzf_colors['fg+'] = ['fg', 'Normal']
let g:fzf_colors['hl'] = ['bg', 'IncSearch']
