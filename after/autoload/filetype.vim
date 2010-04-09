" apply prose filetype to current buffer
function! filetype#prose()
  if !exists('b:did_load_filetype_prose') && &filetype != 'prose'
    let b:did_load_filetype_prose = 1
    Unftbundle prose
    runtime ftplugin/prose.vim
    runtime! ftplugin/prose/*.vim
  endif
endfunction
