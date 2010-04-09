" make comments brighter
"highlight Comment ctermfg=66 guifg=#5f8787
"highlight Comment ctermfg=71 guifg=#5faf5f
"highlight Comment ctermfg=72 guifg=#5faf87
"highlight Comment ctermfg=101 guifg=#87875f
highlight Comment ctermfg=102 guifg=#878787
"highlight Comment ctermfg=138 guifg=#af8787
"highlight Comment ctermfg=144 guifg=#afaf87
"highlight rubyCurlyBlockDelimiter ctermfg=146 guifg=#afafdf
"highlight Comment ctermfg=145 guifg=#afafaf
"highlight Comment ctermfg=146 guifg=#afafdf
"highlight Comment ctermfg=244 guifg=#808080
"highlight Comment ctermfg=245 guifg=#8a8a8a
"highlight Comment ctermfg=151 guifg=#afdfaf
"highlight Comment ctermfg=36 guifg=#00af87
"highlight Comment ctermfg=37 guifg=#00afaf

" make keywords brighter
highlight Keyword ctermfg=175 guifg=#df87af

"highlight Repeat ctermfg=67 guifg=#5f87af
highlight Repeat ctermfg=74 guifg=#5fafdf
"highlight Repeat ctermfg=75 guifg=#5fafff

"highlight rubyClass ctermfg=30 guifg=#008787
"highlight rubyClass ctermfg=36 guifg=#00af87
highlight rubyClass ctermfg=37 guifg=#00afaf
"highlight rubyClass ctermfg=38 guifg=#00afdf
"highlight rubyClass ctermfg=43 guifg=#00dfaf
highlight! link rubyModule rubyClass

"highlight rubyPredefinedIdentifier ctermfg=209 guifg=#ff875f
highlight rubyPredefinedIdentifier ctermfg=210 guifg=#ff8787
"highlight rubyPredefinedIdentifier ctermfg=215 guifg=#ffaf5f
"highlight rubyPredefinedIdentifier ctermfg=67 guifg=#5f87af
"highlight rubyPredefinedIdentifier ctermfg=75 guifg=#5fafff

"highlight Boolean ctermfg=104 guifg=#8787df
highlight Boolean ctermfg=111 guifg=#87afff
"highlight! link Boolean Conditional "ctermfg=110 guifg=#87afdf

"highlight Function ctermfg=180 guifg=#dfaf87
"highlight Function ctermfg=181 guifg=#dfafaf
"highlight Function ctermfg=185 guifg=#dfdf5f
"highlight Function ctermfg=186 guifg=#dfdf87
"highlight Function ctermfg=192 guifg=#dfff87
"highlight! link Function Number "ctermfg=222 guifg=#ffdf87
highlight Number ctermfg=185 guifg=#dfdf5f
highlight Function ctermfg=222 guifg=#ffdf87
"highlight Function ctermfg=223 guifg=#ffdfaf

highlight! link rubyCapitalizedMethod Function
"highlight rubyCapitalizedMethod ctermfg=180 guifg=#dfaf87

" make exceptions brighter
highlight Todo ctermfg=204 guifg=#ff5f87
highlight Exception ctermfg=211 guifg=#ff87af

" make Git summary brighter
"highlight! link gitcommitSummary Special

" make listchars dimmer
highlight NonText ctermfg=238

" LimeLight already supports seoul256
if exists('g:limelight_conceal_ctermfg')
  unlet g:limelight_conceal_ctermfg
endif

" Airline support for seoul256
let g:airline_theme='bubblegum'
