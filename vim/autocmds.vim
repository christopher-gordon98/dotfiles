" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  augroup MyAutoCommands
    " Clear the auto command group so we don't define it multiple times
    " Idea from http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
    autocmd!
    " No formatting on o key newlines
    autocmd BufNewFile,BufEnter * set formatoptions-=o

    " No more complaining about untitled documents
    autocmd FocusLost silent! :wa

    " When editing a file, always jump to the last cursor position.
    " This must be after the uncompress commands.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line ("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

    " Fix trailing whitespace in my most used programming langauges
    autocmd BufWritePre *.py,*.js,*.rb,*.erb,*.md,*.scss,*.vim,Cakefile,
          \*.hbs
          \ silent! :StripTrailingWhiteSpace


    " Fix accidental indentation in html files
    " from http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html
    autocmd FileType html setlocal indentkeys-=*<Return>

    " Leave the return key alone when in command line windows, since it's used
    " to run commands there.
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()

    " Resize splits when the window is resized
    " from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
    au VimResized * :wincmd =
  augroup END
endif

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript set ts=2 sts=2 sw=2 expandtab
autocmd FileType python set ts=4 sts=4 sw=4 expandtab
autocmd FileType php set ts=4 sts=4 sw=4 expandtab

autocmd! FileType * call SetDictionary()
autocmd! BufNewFile * call LoadTemplate()
"set current working directory automatically
autocmd BufEnter * silent! lcd %:p:h

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
let s:default_path = escape(&path, '\ ') " store default value of 'path'
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig

" ----------------------------------------
" Auto Commands - for direnv
" ----------------------------------------
" direnv.vim - support for direnv <http://direnv.net>
" Author:       zimbatm <http://zimbatm.com/>
" Version:      0.1

if exists("g:loaded_direnv") || &cp || v:version < 700
  finish
endif
let g:loaded_direnv = 1

command! -nargs=0 DirenvExport call <SID>DirenvExport ()

function! s:DirenvExport()
  " FIXME: vim seems to read both stdout and stderr, it would be nice to
  "        display stderr in a buffer on error
  execute system('direnv export vim 2>/dev/null')
endfunction

" TODO: Execute DirenvExport on load
" TODO: Execute DirenvExport when the PWD changes
"       vim doesn't have a chdir event unfortunately

if has("autocmd")
  augroup direnv
    autocmd VimEnter * call s:DirenvExport()
    autocmd BufEnter * call s:DirenvExport()
  augroup END

  autocmd BufRead,BufNewFile .envrc set filetype=sh
endif

" vim:set ft=vim sw=2 sts=2 et:





