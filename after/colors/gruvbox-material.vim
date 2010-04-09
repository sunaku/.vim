" less intense colors in the tabline
highlight! link TabLine StatusLineNC
highlight! link TabLineSel Aqua

" disable italics (reverse video) for comments
highlight Comment cterm=none gui=none

" FZF integration
let g:fzf_colors = {}
let g:fzf_colors['fg'] = ['fg', 'Comment']
let g:fzf_colors['fg+'] = ['fg', 'Normal']
let g:fzf_colors['hl'] = ['bg', 'IncSearch']
