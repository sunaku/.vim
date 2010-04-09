" https://www.mail-archive.com/tmux-users@lists.sourceforge.net/msg07127.html
if exists('&ttymouse') " neovim lacks it
  if exists('$TMUX') && v:version >= 704
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
end
