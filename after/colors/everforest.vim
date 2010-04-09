" less intense colors in the tabline
highlight TabLineSel gui=reverse

" mirror top & bottom of current buffer
highlight! link StatusLine TabLine

" brighter text for current line number
highlight! link CursorLineNr TabLineSel

" make ultrathin fonts easier to see
highlight DiffText gui=bold
highlight IncSearch gui=bold
highlight Search gui=bold

" FZF integration
let g:fzf_colors = {}
let g:fzf_colors['fg'] = ['fg', 'Comment']
let g:fzf_colors['fg+'] = ['fg', 'Normal']
let g:fzf_colors['hl'] = ['bg', 'IncSearch']
