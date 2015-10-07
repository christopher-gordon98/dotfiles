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

    " Help mode bindings
    " <enter> to follow tag, <bs> to go back, and q to quit.
    " From http://ctoomey.com/posts/an-incremental-approach-to-vim/
    autocmd filetype help nnoremap <buffer><cr> <c-]>
    autocmd filetype help nnoremap <buffer><bs> <c-T>
    autocmd filetype help nnoremap <buffer>q :q<CR>

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


"Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript set ts=2 sts=2 sw=2 expandtab

autocmd! FileType * call SetDictionary()
autocmd! BufNewFile * call LoadTemplate()
au FocusLost * :silent! wall
au VimResized * :wincmd =

"set current working directory automatically
autocmd BufEnter * silent! lcd %:p:h

let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path
