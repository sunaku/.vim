" use comma as <Leader> key in shortcuts
let mapleader = ','

" list all <Leader> shortcuts in a menu
execute 'noremap' mapleader ':map' mapleader '<Return>'
