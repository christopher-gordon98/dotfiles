if exists('g:vundle_installing_plugins')
  Plugin 'aaron-goshine/mathvim'
  finish
endif


vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++
