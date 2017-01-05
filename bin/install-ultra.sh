#!/bin/bash
source $HOME/.dotfiles/shells/functions.sh

#==========================================================
t1=$(get_ultra_rule_str ' Ultra dotfiles installer ' 0 0)
echo "$t1"

DOTDIR="$HOME/.dotfiles"
LIGHTWVIM=0
TREW=1
BAD_FILE=85

#==========================================================
t1=$(get_ultra_rule_str ' Installing sub modules ' 0 0)
echo "$t1"
rm -rf $DOTDIR/vim/bundle/vundle $DOTDIR/shells/bash  $DOTDIR/shells/zsh 2> /dev/null

git clone https://github.com/aaron-goshine/bash-it.git $DOTDIR/shells/bash

git clone https://github.com/aaron-goshine/oh-my-zsh.git $DOTDIR/shells/zsh

git clone https://github.com/VundleVim/Vundle.vim.git $DOTDIR/vim/bundle/vundle

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
  rm -rf $BNAME 2> /dev/null
  ln -s $1 $BNAME
}

slimlinker $DOTDIR/bin/
slimlinker $DOTDIR/config/ 
slimlinker $DOTDIR/tmux/
slimlinker $DOTDIR/vifm/
slimlinker $DOTDIR/vim/
slimlinker $DOTDIR/emacs.d
slimlinker $DOTDIR/git/gitconfig

ln -s $DOTDIR/tmux/.tmux.conf ~/.tmux.conf 

for FILE in $(ls $DOTDIR/xrc/); 
do
  slimlinker $DOTDIR/xrc/$FILE
done;

rm -rf ~/.task ~/.gnupg ~/.password-store ~/bin 2> /dev/null
ln -s $DOTDIR/bin/ ~/bin
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/task/ ~/.task
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.gnupg ~/.gnupg
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.password-store ~/.password-store


success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing homebrew packages ' 0 0)
echo "$t1"
brew update
source $DOTDIR/bin/homebrew-sync.sh
npm install eslint tern -g
success "done"
# #==========================================================
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
    rm -rf ~/.vimrc ~/.nvimrc 2> /dev/null 
    ln -s $DOTDIR/vim/light_weight_vimrc.vim ~/.vimrc
    ln -s $DOTDIR/vim/light_weight_vimrc.vim ~/.nvimrc
  else
    rm -rf ~/.vimrc ~/.nvimrc 2> /dev/null
    ln -s $DOTDIR/vim/vimrc.vim ~/.vimrc
    ln -s $DOTDIR/vim/vimrc.vim ~/.nvimrc
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
git submodule sync

source $DOTDIR/vim/bundle/Youcompleteme/install.sh

#==========================================================
t1=$(get_ultra_rule_str 'Enjoy' 0 0 '∿')
echo "$t1"
success "done"

OPTIONS="KEEP_BSH_PROFILE REPLACE"
select opt in $OPTIONS; do
  if [ "$REPLY" = "1" ]; then
    t1=$(get_ultra_rule_str ' Keeping bash_profile but injecting source ' 0 0)
    echo "$t1"
    cat $DOTDIR/shells/localenv-template.sh $DOTDIR/shells/local-source-bash.sh >> ~/.bash_profile
    cat $DOTDIR/shells/localenv-template.sh $DOTDIR/shells/local-source-zsh.sh >> ~/.zshrc
  elif [ "$REPLY" = "2" ]; then
    t1=$(get_ultra_rule_str ' replace bash_profile ' 0 0)
    echo "$t1"
    slimlinker $DOTDIR/shells/bash_profile
    slimlinker $DOTDIR/shells/zshrc
  fi
exit
done
unset DOTDIR
unset LIGHTWVIM
unset TREW
unset BAD_FILE
sleep 3
clear
