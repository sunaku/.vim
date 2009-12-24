" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~ '^screen' && !has('nvim') | exe "set t_ts=\e]2; t_fs=\7" | endif

" https://www.mail-archive.com/tmux-users@lists.sourceforge.net/msg07127.html
if exists('&ttymouse') " neovim lacks it
  if exists('$TMUX') && v:version >= 704
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
end
