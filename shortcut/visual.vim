" visually select the text that was last edited or pasted
nnoremap gV `[v`]

" emulate selection of nearest search result in Vim < 7.4
if v:version < 704
  nnoremap gn //e<Return>v??<Return>
  nnoremap gN ??e<Return>v??<Return>
endif

call shortcut#map('<Space> v b', 'Visual -> Buffer', "normal! m'ggVG")
