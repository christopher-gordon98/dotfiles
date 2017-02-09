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

let g:syntastic_css_checkers = ['stylelint']

let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute ', 'is not recognized!', 'discarding unexpected' ]

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:syntastic_python_checkers=['pylint', 'flake8', 'pyflakes', 'pep8']

