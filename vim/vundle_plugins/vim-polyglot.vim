if exists('g:vundle_installing_plugins')
  Plugin 'sheerun/vim-polyglot'
  finish
endif

" I use the same repo, but I want it to be as up to date as possible.
let g:polyglot_disabled = ['javascript', 'markdown']
let g:vim_json_syntax_conceal = 1
