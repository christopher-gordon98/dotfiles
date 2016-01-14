if exists('g:vundle_installing_plugins')
  Plugin 'scrooloose/syntastic'
  finish
endif



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq =  0

let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute ', 'is not recognized!', 'discarding unexpected' ]
