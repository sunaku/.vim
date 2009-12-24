" base this configuration on the example vimrc files that come with vim

if v:version >= 800
  runtime defaults.vim
else
  runtime vimrc_example.vim
endif

if has('gui_running')
  runtime gvimrc_example.vim
endif
