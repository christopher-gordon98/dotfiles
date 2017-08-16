#!/bin/bash
source $HOME/.dotfiles/bash/libs/functions.bash
# Get the latest versions from git, make sure you have git installed

# TODO: implement feature to update php global packages
# TODO: implement automation to up date PHP_CodeSniffer and
# git clone https://github.com/squizlabs/PHP_CodeSniffer.git phpcs
# git clone git://github.com/phpmd/phpmd.git
#==========================================================
t1=$(get_ultra_rule_str ' Ultra dotfiles installer ' 0 0)
echo "$t1"

DOTDIR="$HOME/.dotfiles"
LIGHTWVIM=0
TREW=1
BAD_FILE=85

#==========================================================
t1=$(get_ultra_rule_str ' Updating git sub modules ' 0 0)
echo "$t1"
git submodule update 
git submodule sync
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Creating symlinks for dot directories ' 0 0)
echo "$t1"
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
slimlinker $DOTDIR/ipython/
slimlinker $DOTDIR/emacs.d
slimlinker $DOTDIR/git/gitconfig

ln -s $DOTDIR/tmux/.tmux.conf ~/.tmux.conf 

for FILE in $(ls $DOTDIR/xrc/); 
do
  slimlinker $DOTDIR/xrc/$FILE
done;


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


rm -rf ~/.task ~/.gnupg ~/.password-store ~/bin 2> /dev/null
ln -s $DOTDIR/bin/ ~/bin
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/task/ ~/.task
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.gnupg ~/.gnupg
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.password-store ~/.password-store

success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing homebrew packages ' 0 0)
echo "$t1"
cd $DOTDIR
brew update
brew tap Homebrew/bundle
brew bundle dump
brew bundle
cd -
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing global npm packages ' 0 0)
npm install -g eslint
npm install -g jshint
npm install -g eslint-plugin-react
npm install -g tern
npm install -g babel-eslint
npm install -g stylelint
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
python install.py

success "done"
#==========================================================
t1=$(get_ultra_rule_str 'Enjoy' 0 0 '∿')
echo "$t1"
OPTIONS="KEEP_BSH_PROFILE REPLACE"
select opt in $OPTIONS; do
  if [ "$REPLY" = "1" ]; then
    t1=$(get_ultra_rule_str ' Keeping bash_profile but injecting source ' 0 0)
    echo "$t1"
    cat $DOTDIR/shells/localenv-template.sh $DOTDIR/shells/local-source-bash.sh >> ~/.bash_profile
  elif [ "$REPLY" = "2" ]; then
    t1=$(get_ultra_rule_str ' replace bash_profile ' 0 0)
    echo "$t1"
    slimlinker $DOTDIR/bash/bash_profile
  fi
exit
done
unset DOTDIR
unset LIGHTWVIM
unset TREW
unset BAD_FILE
sleep 3
clear
