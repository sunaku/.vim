" ignore *.get files in Windows' globpath()
" see http://goo.gl/g1EcnJ for more details
set wildignore+=*.get/.

" register bundles found in the runtimepath
let g:unbundle_bundles_glob = 'bundle/*/*'
if has('nvim')
  let g:unbundle_bundles_glob = 'bundle*/*/*'
endif
runtime bundle/zzz/unbundle/plugin/unbundle.vim
