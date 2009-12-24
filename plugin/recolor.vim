" delegate colorscheme configuration to your recolor/<colorscheme>.vim files
autocmd ColorScheme * execute 'runtime recolor/'. expand('<amatch>') .'.vim'
