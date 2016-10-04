let g:sneak#prompt = 'Sneak: '

" case sensitivity
let g:sneak#use_ic_scs = 1

" target selection
let g:sneak#label = 1
let g:sneak#target_labels =
      \  'aoeuidhtnspyfgcrlqjkxbmwvz'
      \ .'AOEUIDHTNSPYFGCRLQJKXBMWVZ'
      \ .'1234567890'

Shortcut! f (sneak) sneak forward onto {char}
Shortcut! F (sneak) sneak backward onto {char}
Shortcut! t (sneak) sneak forward until {char}
Shortcut! T (sneak) sneak backward until {char}
Shortcut! s (sneak) sneak forward onto {char}{char}
Shortcut! S (sneak) sneak backward onto {char}{char}
Shortcut! - (sneak) repeat last sneak forward
Shortcut! _ (sneak) repeat last sneak backward

" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" operator-pending-mode
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" 2-character Sneak
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
" visual-mode
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
" operator-pending-mode
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" repeat motion
map - <Plug>Sneak_;
map _ <Plug>Sneak_,
