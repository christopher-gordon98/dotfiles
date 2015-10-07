#!/bin/bash
#************************************************#
#          Written by Aaron-Avenger.             #
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



info 'Installing Vundle'
info '-----------------'
git clone git://github.com/gmarik/vundle.git $DOTDIR/vim/bundle/vundle/

cleanup ".vim" 
cleanup ".tmux"
cleanup ".config"
cleanup "bin"

ln -s $DOTDIR/config ~/.config
ln -s $DOTDIR/tmux ~/.tmux
ln -s $DOTDIR/vim ~/.vim
ln -s $DOTDIR/bin ~/bin
ln -sFfiv $DOTDIR/bash/bash_profile.sh ~/.bash_profile
ln -sFfiv $DOTDIR/tmux/.tmux.conf ~/.tmux.conf
ln -sFfiv $DOTDIR/tmux/.tmux-osx.conf  ~/.tmux-osx.conf
ln -sFfiv $DOTDIR/git/gitconfig.sh ~/.gitconfig
ln -sFfiv $DOTDIR/xrc/curlrc.sh ~/.curlrc
ln -sFfiv $DOTDIR/xrc/wgetrc.sh ~/.wgetrc


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
  else
  ln -sFfiv $DOTDIR/vim/vimrc.vim ~/.vimrc
fi

echo ''
sucess  'Hey! Superhero.'
echo ''

info 'Installing plugins'
info '-------------------------------------------------'
if test $(which mvim)
then
  mvim -v +PluginInstall +qall
else
  if test $(which vim)
  then
    vim +PluginInstall +qall
  else
    fail 'mvim or vim not found in path.'
  fi
fi

success 'Setup complete. Run vim and enjoy'

unset DOTDIR
unset LIGHTWVIM
unset TREW
unset BAD_FILE

exit;
