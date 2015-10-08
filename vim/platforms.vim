" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('gui_macvim')
  " Custom Source Code font for Powerline
  " From: https://github.com/Lokaltog/powerline-fonts
  set guifont=Source\ Code\ Pro\ for\ Powerline:h13
  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif
endif

if has('macunix') || has('mac')
  " Fix meta key for Mac
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr  (c))
  endw
endif
