set autoindent       " automatically indent new lines
set formatoptions+=o " continue comment marker in new lines
set textwidth=78     " hard-wrap long lines as you type them
set tabstop=8        " render TABs using this many spaces
set expandtab        " insert spaces when TAB is pressed
set softtabstop=2    " ... this many spaces
set shiftwidth=2     " indentation amount for < and > commands

" repeat last character to the maximum width of current line
nnoremap <Leader>_ :execute 's/.$/'. repeat('&', &textwidth+1) .'/'<Return>
      \:execute 's/\%>'. &textwidth .'v.//g'<Return>

" insert or update section separator at end of current line
nmap <Leader>- A-<Esc><Leader>_

" format current line as a top-level heading in markdown (uses `z marker)
nmap <Leader>= mzyypVr=:.+1g/^=\+/d<Return>`z

" format current line as a second-level heading in markdown (uses `z marker)
nmap <Leader>+ mzyypVr-:.+1g/^-\+/d<Return>`z
