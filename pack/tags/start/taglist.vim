let Tlist_Sort_Type = 'name'
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1

Shortcut (taglist) show tag name at cursor
      \ nnoremap <silent> <Space>qt :TlistShowPrototype<CR>

Shortcut (taglist) toggle tags sidebar
      \ nnoremap <silent> <Space>tt :TlistToggle<CR>
