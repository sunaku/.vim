" allow virtual editing in Visual block mode
set virtualedit+=block

" visually select the text that was last edited or pasted
nnoremap gV `[v`]

" visually select next nearest search result
nnoremap g/ //e<Return>v??<Return>

" visually select previous nearest search result
nnoremap g? ??e<Return>v??<Return>
