let g:airline_powerline_fonts = 1

" darken text in non-active windows (StatusLineNC)
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'bubblegum'
    " darken the green chiclet in normal mode
    for colors in values(a:palette.normal)
      if colors[3] == 150
        let colors[3] = 108
      endif
    endfor
  elseif g:airline_theme == 'lucius' && g:colors_name == 'seoul256'
    let l:normal = deepcopy(a:palette.normal)
    let l:visual = deepcopy(a:palette.visual)

    " make normal dark, replace red, and visual blue
    let a:palette.normal = l:visual
    let a:palette.replace = l:normal
    for colors in values(a:palette.visual)
      if colors[3] == 236
        let colors[3] = 23
      endif
    endfor
  endif
endfunction
