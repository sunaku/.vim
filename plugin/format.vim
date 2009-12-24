set smarttab         " <Tab> indents with &shiftwidth
set autoindent       " automatically indent new lines
set formatoptions+=c " automatically wrap comment lines
set formatoptions+=n " automatically indent numbered lists
set formatoptions+=o " continue comment marker in new lines
set formatoptions+=j " delete comment character when joining
set textwidth=78     " hard-wrap long lines as you type them
set tabstop=8        " render TABs using this many spaces
set expandtab        " insert spaces when TAB is pressed
set softtabstop=2    " ... this many spaces
set shiftwidth=2     " indentation amount for < and > commands
set nrformats-=octal " no octal numbering for <C-a> and <C-x>

" disable "2 spaces equals 1 tab" indentation style
nnoremap <Leader>=<Tab> :setlocal noexpandtab softtabstop=8 shiftwidth=8<Return>

" enable "2 spaces equals 1 tab" indentation style
nnoremap <Leader>=<Space> :setlocal expandtab softtabstop=2 shiftwidth=2<Return>

" repeat last character to the maximum width of current line
nnoremap <silent> <Leader>=_ :let b:last_search_register=@/
      \ <Bar>execute 's/.$/'. repeat('&', &textwidth+1) .'/'
      \ <Bar>execute 's/\%>'. &textwidth .'v.//g'
      \ <Bar>let @/=b:last_search_register<Return>

" insert or update section separator at end of current line
nmap <Leader>=- A-<Esc><Leader>=_

" format current line as a top-level heading in Markdown (uses `z marker)
nnoremap <Leader>=1 mzyyp:s/^\s*//<Return>Vr===:.+g/^\s*=\+\s*/d<Return>`z

" format current line as a second-level heading in Markdown (uses `z marker)
nnoremap <Leader>=2 mzyyp:s/^\s*//<Return>Vr-==:.+g/^\s*-\+\s*/d<Return>`z

" format current line as table/body separator in Markdown (uses `z marker)
nnoremap <Leader>=<Bar> mzyyp:s/^\s*//
      \ <Bar>s/[^<Bar>]/-/g
      \ <Bar>s/-<Bar>/ <Bar>/g
      \ <Bar>s/<Bar>-/<Bar> /g<Return>
      \ ==:.+g/^\s*[<Bar>-]\+\s*/d<Return>`z

" format selected Markdown indented code block into a fenced code block
vnoremap <Leader>=` 2<']o<Esc>3i`<Esc>yy<C-o>PA
