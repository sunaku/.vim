let NERDSpaceDelims = 1 " pad comment delimiters

Shortcut (NERDCommenter) toggle alternate comment delimiters
      \ map <Space>tC <Plug>NERDCommenterAltDelims

Shortcut (NERDCommenter) uncomment, deleting comment delimiters
      \ map <Space>dc <Plug>NERDCommenterUncomment

Shortcut (NERDCommenter) comment, aligning both delimiters
      \ map <Space>=c <Plug>NERDCommenterAlignBoth

Shortcut (NERDCommenter) comment, aligning left delimiter
      \ map <Space>Ic <Plug>NERDCommenterAlignLeft

Shortcut (NERDCommenter) append comment at end of line
      \ map <Space>ac <Plug>NERDCommenterAppend

Shortcut (NERDCommenter) yank then comment
      \ map <Space>yc <Plug>NERDCommenterYank

Shortcut (NERDCommenter) comment, sexily
      \ map <Space>1c <Plug>NERDCommenterSexy

Shortcut (NERDCommenter) invert comment markers
      \ map <Space>tc <Plug>NERDCommenterInvert

Shortcut (NERDCommenter) comment from cursor to end of line
      \ map <Space>iC <Plug>NERDCommenterToEOL

Shortcut (NERDCommenter) comment, nesting
      \ map <Space>2c <Plug>NERDCommenterNested

Shortcut (NERDCommenter) comment, minimally
      \ map <Space>0c <Plug>NERDCommenterMinimal

Shortcut (NERDCommenter) toggle comment markers
      \ map <Space>Tc <Plug>NERDCommenterToggle

Shortcut (NERDCommenter) comment, inserting comment delimiters
      \ map <Space>ic <Plug>NERDCommenterComment

Shortcut (NERDCommenter) duplicate above cursor and comment
      \ map <Space>Pc  <Plug>NERDCommenterYank`[P

Shortcut (NERDCommenter) duplicate below cursor and comment
      \ map <Space>pc  <Plug>NERDCommenterYank`]p
