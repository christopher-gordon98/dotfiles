#!/bin/bash
#************************************************#
#          Written by Aaron.                     #
#************************************************#

# --------------------------------------------------------- #
          #   Avenger dotfiles installer #
# --------------------------------------------------------- #

DOTDIR="$HOME/.dotfiles"
LIGHTWVIM=0
TREW=1
BAD_FILE=85

info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

cleanup()
{ rm -rf "$HOME/$1"
  return 0   # Success.
} 


info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
info 'Installing Vundle'
info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

git clone git://github.com/gmarik/vundle.git $DOTDIR/vim/bundle/vundle/


info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
info 'updating git sub modules'
info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  git submodule update --recursive --remote


cleanup "~/bin"
cleanup "~/.config"
cleanup "~/.tmux"
cleanup "~/.vifm"
cleanup "~/.vim" 
cleanup "~/.nvim" 
cleanup "~/.emacs.d" 
cleanup "~/.emacs" 



ln -s $DOTDIR/bin ~/bin
ln -s $DOTDIR/config ~/.config
ln -s $DOTDIR/tmux ~/.tmux
ln -s $DOTDIR/vifm ~/.vifm
ln -s $DOTDIR/vim ~/.nvim
ln -s $DOTDIR/vim ~/.vim
ln -sFfiv $DOTDIR/emacs ~/.emacs.d

ln -sFfiv $DOTDIR/shells/bash_profile.sh ~/.bash_profile
ln -sFfiv $DOTDIR/shells/zshrc.sh ~/.zshrc

ln -sFfiv $DOTDIR/tmux/.tmux.conf ~/.tmux.conf
ln -sFfiv $DOTDIR/tmux/.tmux-osx.conf  ~/.tmux-osx.conf
ln -sFfiv $DOTDIR/git/gitconfig.sh ~/.gitconfig

ln -sFfiv $DOTDIR/xrc/curlrc.sh ~/.curlrc
ln -sFfiv $DOTDIR/xrc/czrc.json ~/.czrc
ln -sFfiv $DOTDIR/xrc/wgetrc.sh ~/.wgetrc
ln -sFfiv $DOTDIR/xrc/pystartup.sh ~/.pystartup
ln -sFfiv $DOTDIR/xrc/eslintrc.json ~/.eslintrc
ln -sFfiv $DOTDIR/xrc/jshintrc.json ~/.jshintrc
ln -sFfiv $DOTDIR/xrc/jrnl_config.json ~/.jrnl_config

ln -sFfiv ~/Library/Mobile\ Documents/com~apple~CloudDocs/task/ ~/.task
ln -sFfiv ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.gnupg ~/.gnupg
ln -sFfiv ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.password-store ~/.password-store



while getopts ":l" opt; do
  case $opt in
    l)
      LIGHTWVIM=1
      ;;
  esac
done

if [ "$LIGHTWVIM" -eq "$TREW" ] 
  then
    ln -sFfiv $DOTDIR/vim/light_weight_vimrc.vim ~/.vimrc
    ln -sFfiv $DOTDIR/vim/light_weight_vimrc.vim ~/.nvimrc
  else
    ln -sFfiv $DOTDIR/vim/vimrc.vim ~/.vimrc
    ln -sFfiv $DOTDIR/vim/vimrc.vim ~/.nvimrc
fi

info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
info 'Installing home brew'
info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

source $DOTDIR/bin/homebrew-sync.sh

info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
info 'Installing plugins'
info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

if test $(which mvim)
then
  mvim -v +PluginInstall +qall
  mvim -v +PluginUpdate +qall
else
  if test $(which vim)
  then
    vim +PluginInstall +qall
    vim +PluginUpdate +qall
  else
    fail 'mvim or vim not found in path.'
  fi
fi

info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
success  'Hey! Superhero.'
info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
success 'Setup complete. Run vim and enjoy'
info '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

unset DOTDIR
unset LIGHTWVIM
unset TREW
unset BAD_FILE
exit;
