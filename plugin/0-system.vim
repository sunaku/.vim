" base this configuration on the official example vimrc,
" which is maintained by the great Bram Moolenaar himself!
function! s:LoadExampleVimrc(prefix)
  let l:example = globpath(&runtimepath, a:prefix . 'vimrc_example.vim')
  if !empty(l:example)
    execute 'source' fnameescape(l:example)
  endif
endfunction

call s:LoadExampleVimrc('')
if has('gui_running')
  call s:LoadExampleVimrc('g')
endif
