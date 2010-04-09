let g:fuf_modesDisable = ['mrucmd']
let g:fuf_previewHeight = 0
let g:fuf_keyOpenSplit = '<Leader>2'
let g:fuf_keyOpenVsplit = '<Leader>3'

nnoremap <Leader>o :FufFileWithCurrentBufferDir<Return>
nnoremap <Leader>O :FufMruFile<Return>
nnoremap <Leader>6 :FufBuffer<Return>
nnoremap <Leader>/ :FufLine<Return>
