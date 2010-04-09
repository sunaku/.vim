" less intense colors in the tabline
highlight TabLineSel gui=reverse
" highlight! link TabLine StatusLineNC
" highlight! link TabLineSel Aqua

" mirror top & bottom of current buffer
highlight! link StatusLine TabLine

" brighter text for current line number
highlight! link CursorLineNr StatusLine

" brighter text for current line number
highlight! link CursorLineNr StatusLine

" disable italics (reverse video) for comments
highlight Comment cterm=none gui=none

" make ultrathin fonts easier to see
highlight DiffText gui=bold
highlight IncSearch gui=bold
highlight Search gui=bold

" FZF integration
let g:fzf_colors = {}
let g:fzf_colors['fg'] = ['fg', 'Comment']
let g:fzf_colors['fg+'] = ['fg', 'Normal']
let g:fzf_colors['hl'] = ['bg', 'IncSearch']
