" https://github.com/lifepillar/vim-mucomplete/issues/104
if !has('python') && !has('python3')
  " Error: Required vim compiled with +python
  " E117: Unknown function: pythoncomplete#Complete
  setlocal omnifunc=
endif
