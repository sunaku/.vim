" delegate colorscheme configuration to your recolor/<colorscheme>.vim files
autocmd ColorScheme * execute 'runtime after/colors/'. expand('<amatch>') .'.vim'
