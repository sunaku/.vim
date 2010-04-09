map s <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

Shortcut! sf  (EasyMotion) Find {char} to the right.
Shortcut! sF  (EasyMotion) Find {char} to the left.
Shortcut! st  (EasyMotion) Till before the {char} to the right.
Shortcut! sT  (EasyMotion) Till after the {char} to the left.
Shortcut! sw  (EasyMotion) Beginning of word forward.
Shortcut! sW  (EasyMotion) Beginning of WORD forward.
Shortcut! sb  (EasyMotion) Beginning of word backward.
Shortcut! sB  (EasyMotion) Beginning of WORD backward.
Shortcut! se  (EasyMotion) End of word forward.
Shortcut! sE  (EasyMotion) End of WORD forward.
Shortcut! sge (EasyMotion) End of word backward.
Shortcut! sgE (EasyMotion) End of WORD backward.
Shortcut! sj  (EasyMotion) Line downward.
Shortcut! sk  (EasyMotion) Line upward.
Shortcut! sn  (EasyMotion) Jump to latest "/" or "?" forward.
Shortcut! sN  (EasyMotion) Jump to latest "/" or "?" backward.
" Shortcut! ss  (EasyMotion) Find {char} forward and backward.

Shortcut (EasyMotion) Jump forward, landing on top of {char}.
      \ map f <Plug>(easymotion-f)

Shortcut (EasyMotion) Jump backward, landing on top of {char}.
      \ map F <Plug>(easymotion-F)

Shortcut (EasyMotion) Jump forward, landing just before {char}.
      \ map t <Plug>(easymotion-t)

Shortcut (EasyMotion) Jump backward, landing just after {char}.
      \ map T <Plug>(easymotion-T)

Shortcut (EasyMotion) Repeat last motion forward.
      \ map - <Plug>(easymotion-next)

Shortcut (EasyMotion) Repeat last motion backward.
      \ map _ <Plug>(easymotion-prev)

Shortcut (EasyMotion) Repeat last motion, including last search target.
      \ map s. <Plug>(easymotion-repeat)

Shortcut (EasyMotion) Beginning of line in all windows.
      \ map sl <Plug>(easymotion-overwin-line)

Shortcut (EasyMotion) Beginning of word in all windows.
      \ map sw <Plug>(easymotion-overwin-w)

Shortcut (EasyMotion) Find {char} in all open windows.
      \ map sc <Plug>(easymotion-overwin-f)

Shortcut (EasyMotion) Jump anywhere in current window.
      \ map ss <Plug>(easymotion-jumptoanywhere)

Shortcut (EasyMotion) Jump anywhere in current line.
      \ map S <Plug>(easymotion-lineanywhere)

Shortcut (EasyMotion) Search for N characters in current window.
      \ map s3 <Plug>(easymotion-sn)

Shortcut (EasyMotion) Search for 2 characters in current window.
      \ map s2 <Plug>(easymotion-s2)

Shortcut (EasyMotion) Find {char} forward and backward.
      \ map s1 <Plug>(easymotion-s)
