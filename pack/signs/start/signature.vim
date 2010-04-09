let g:SignatureMap = {
  \ 'Leader'             :  "m",
  \ 'PlaceNextMark'      :  "m,",
  \ 'ToggleMarkAtLine'   :  "m.",
  \ 'PurgeMarksAtLine'   :  "m-",
  \ 'DeleteMark'         :  "dm",
  \ 'PurgeMarks'         :  "m<Space>",
  \ 'PurgeMarkers'       :  "m<BS>",
  \ 'GotoNextLineAlpha'  :  "m']",
  \ 'GotoPrevLineAlpha'  :  "m'[",
  \ 'GotoNextSpotAlpha'  :  "m`]",
  \ 'GotoPrevSpotAlpha'  :  "m`[",
  \ 'GotoNextLineByPos'  :  "m]'",
  \ 'GotoPrevLineByPos'  :  "m['",
  \ 'GotoNextSpotByPos'  :  "m]`",
  \ 'GotoPrevSpotByPos'  :  "m[`",
  \ 'GotoNextMarker'     :  "m[+",
  \ 'GotoPrevMarker'     :  "m[-",
  \ 'GotoNextMarkerAny'  :  "m]=",
  \ 'GotoPrevMarkerAny'  :  "m[=",
  \ 'ListLocalMarks'     :  "m/",
  \ 'ListLocalMarkers'   :  "m?"
  \ }

Shortcut!  mx           (signature) Toggle mark 'x' and display it in the leftmost column
Shortcut!  dmx          (signature) Remove mark 'x' where x is a-zA-Z

Shortcut!  m,           (signature) Place the next available mark
Shortcut!  m.           (signature) If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
Shortcut!  m-           (signature) Delete all marks from the current line
Shortcut!  m<Space>     (signature) Delete all marks from the current buffer
Shortcut!  m]`           (signature) Jump to next mark
Shortcut!  m[`           (signature) Jump to prev mark
Shortcut!  m]'           (signature) Jump to start of next line containing a mark
Shortcut!  m['           (signature) Jump to start of prev line containing a mark
Shortcut!  m`]           (signature) Jump by alphabetical order to next mark
Shortcut!  m`[           (signature) Jump by alphabetical order to prev mark
Shortcut!  m']           (signature) Jump by alphabetical order to start of next line having a mark
Shortcut!  m'[           (signature) Jump by alphabetical order to start of prev line having a mark
Shortcut!  m/           (signature) Open location list and display marks from current buffer

Shortcut!  m[0-9]       (signature) Toggle the corresponding marker !@#$%^&*()
Shortcut!  m<S-[0-9]>   (signature) Remove all markers of the same type
Shortcut!  m]-           (signature) Jump to next line having a marker of the same type
Shortcut!  m[-           (signature) Jump to prev line having a marker of the same type
Shortcut!  m]=           (signature) Jump to next line having a marker of any type
Shortcut!  m[=           (signature) Jump to prev line having a marker of any type
Shortcut!  m?           (signature) Open location list and display markers from current buffer
Shortcut!  m<BS>        (signature) Remove all markers
