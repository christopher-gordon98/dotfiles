" =============================================================================
" Arter: Aaron Goshine
" Description: The Vim Configuration of Superheros
" Version: 0.0.1
" Inheritance: This vimrc is base on (dot_vim) with serious weight loss
" =============================================================================

filetype plugin indent on
" Platform (Windows, Mac, etc.) configuration.
source ~/.vim/platforms.vim
" All of the Vim configuration.
source ~/.vim/config.vim
" New commands
source ~/.vim/commands.vim
" All hotkeys, not dependant on plugins, are mapped here.
source ~/.vim/mappings.vim
" Load plugin-specific configuration.
source ~/.vim/functions.vim
" Auto commands.
source ~/.vim/autocmds.vim

autocmd! FileType * call SetDictionary()
autocmd! BufNewFile * call LoadTemplate()
au FocusLost * :silent! wall
au VimResized * :wincmd =

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascripti,jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



