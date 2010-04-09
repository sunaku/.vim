" map the default shortcuts
call shortcut#map('<Space>        ', 'Shortcut -> Discover') " fallback
call shortcut#map('<Space> <Space>', 'Shortcut -> Discover') " trigger
call shortcut#map('<Space> .      ', 'Shortcut -> Repeat')   " repeat

" load shortcut definitions
runtime! shortcut/**/*.vim
