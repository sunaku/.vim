" lexima <CR> conflicts with ins-completion-menu
" https://github.com/cohama/lexima.vim/issues/65
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
call lexima#insmode#map_hook('before', '<CR>', '')
