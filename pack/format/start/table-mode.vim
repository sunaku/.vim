nnoremap <silent> <Space>tT :TableModeToggle<CR>

let g:table_mode_map_prefix        = '<Space>\T'
let g:table_mode_realign_map       = '<Space>=T'
let g:table_mode_delete_row_map    = '<Space>dT'
let g:table_mode_delete_column_map = '<Space>DT'
let g:table_mode_add_formula_map   = '<Space>1T'
let g:table_mode_eval_formula_map  = '<Space>!T'
let g:table_mode_echo_cell_map     = '<Space>gT'
let g:table_mode_sort_map          = '<Space>0T'
let g:table_mode_tableize_map      = '<Space>fT'
let g:table_mode_tableize_d_map    = '<Space>FT'

Shortcut! <Space>tT (table-mode) toggle table mode for current buffer
Shortcut! <Space>=T (table-mode) realign table columns
Shortcut! <Space>dT (table-mode) delete current row or [count] rows
Shortcut! <Space>DT (table-mode) delete current column or [count] right columns
Shortcut! <Space>1T (table-mode) add fomula for current table cell
Shortcut! <Space>!T (table-mode) evaluate "tmf:" formula line
Shortcut! <Space>gT (table-mode) inspect table, for defining formulas
Shortcut! <Space>0T (table-mode) sort current column at cursor
Shortcut! <Space>fT (table-mode) tabelize selection, using | as delimiter
Shortcut! <Space>FT (table-mode) tableize selection, asking for delimiter

Shortcut! |         (table-mode) trigger table creation in table mode
Shortcut! ||        (table-mode) expand borders of table header
Shortcut! [|        (table-mode) move cursor to previous table cell
Shortcut! ]|        (table-mode) move cursor to next table cell
Shortcut! {|        (table-mode) move cursor to table cell above
Shortcut! }|        (table-mode) move cursor to table cell below

Shortcut! va| (textobj) select around table cell (table-mode)
Shortcut! vi| (textobj) select inside table cell (table-mode)
