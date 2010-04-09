nmap R <Plug>ReplaceOperator
vmap R <Plug>ReplaceOperator
noremap \R R

" ["x]X{motion}		Delete {motion} text [into register x] but replace
                        " it with register content before.
nmap <Leader>R <Plug>ExchangeOperator
vmap <Leader>R <Plug>ExchangeOperator
