#!/bin/bash
source $HOME/.dotfiles/shells/functions.sh

# OPTIONS="BLOW_BASH_PROFILE_AWAY QUIT"
# select opt in $OPTIONS; do
#   if [ "$opt" = "2" ]; then
#     echo done
#     exit
#   elif [ "$opt" = "1" ]; then
#     echo Hello World
#   else
#     echo bad option
#     exit
#   fi
# done
#==========================================================
t1=$(get_ultra_rule_str ' Ultra dotfiles installer ' 0 0)
echo "$t1"

DOTDIR="$HOME/.dotfiles"
LIGHTWVIM=0
TREW=1
BAD_FILE=85

#==========================================================
t1=$(get_ultra_rule_str ' Installing Vundle ' 0 0)
echo "$t1"
rm -rf $DOTDIR/vim/bundle/vundle
git clone git://github.com/gmarik/vundle.git $DOTDIR/vim/bundle/vundle/
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Updating git sub modules ' 0 0)
echo "$t1"
git submodule update 
git submodule sync
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Creating symlinks ' 0 0)
echo "$t1"
success "done"

function slimlinker() {
  local BNAME="$HOME/.$(basename $1)"
  rm -rf $BNAME
  ln -s $1 $BNAME
}

slimlinker $DOTDIR/bin/
slimlinker $DOTDIR/shells/bash_profile
slimlinker $DOTDIR/config/ 
slimlinker $DOTDIR/tmux/
slimlinker $DOTDIR/vifm/
slimlinker $DOTDIR/vim/
slimlinker $DOTDIR/emacs.d
slimlinker $DOTDIR/shells/zshrc
slimlinker $DOTDIR/git/gitconfig

for FILE in $(ls $DOTDIR/xrc/); 
do
  slimlinker $DOTDIR/xrc/$FILE
done;

ln -sFfiv ~/Library/Mobile\ Documents/com~apple~CloudDocs/task/ ~/.task
ln -sFfiv ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.gnupg ~/.gnupg
ln -sFfiv ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.password-store ~/.password-store
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing homebrew packages ' 0 0)
echo "$t1"
source $DOTDIR/bin/homebrew-sync.sh
npm install eslint tern -g
success "done"
#==========================================================
t1=$(get_ultra_rule_str 'Installing vim config symlinks' 0 0)
echo "$t1"

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
success "done"
#==========================================================
t1=$(get_ultra_rule_str 'Installing vim plugins' 0 0)
echo "$t1"

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

cd $DOTDIR/vim/
mkdir .tmp .backup .temp
cd $DOTDIR/vim/bundle/YouCompleteMe/
git submodule update 
git submodule sycn 

source $DOTDIR/vim/bundle/Youcompleteme/install.sh

#==========================================================
t1=$(get_ultra_rule_str 'Enjoy' 0 0 '∿')
echo "$t1"
success "done"
unset DOTDIR
unset LIGHTWVIM
unset TREW
unset BAD_FILE
sleep 3
clear
source source $HOME/.dotfiles/shells/prompt.sh;
