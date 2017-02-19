source $HOME/.dotfiles/shells/functions.sh

TITLE=$(get_ultra_rule_str ' ALWAYS RTFMP ' 0 0)
ULTRANAME=$(get_ultra_rule_str " ✿ ULTRA $(whoami | sed 's/\.[a-z]*$//' | awk '{print toupper($0)}') ✿ " 0 0)
RULE=$(get_ultra_rule_str '' 0 0) 
FMNO=$(get_ultra_rule_str ' ✿ ' 0 0) 

function ultra_prompt () {
  TITLE=$(get_ultra_rule_str ' ALWAYS RTFMP ')
  ULTRANAME=$(get_ultra_rule_str " ULTRA $(whoami | sed 's/\.[a-z]*$//' | awk '{print toupper($0)}') ")
  RULE=$(get_ultra_rule_str '') 
  FMNO=$(get_ultra_rule_str ' ✿ ') 

  echo " "
  echo "██╗   ██╗██╗  ████████╗██████╗  █████╗  $TITLE"
  echo "██║   ██║██║  ╚══██╔══╝██╔══██╗██╔══██╗ $RULE"
  echo "██║   ██║██║     ██║   ██████╔╝███████║ $FMNO"
  echo "██║   ██║██║     ██║   ██╔══██╗██╔══██║ $RULE"
  echo "╚██████╔╝███████╗██║   ██║  ██║██║  ██║ $ULTRANAME"
  echo " ╚═════╝ ╚══════╝╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ $RULE"
}

echo "$ULTRANAME"
echo "$RULE"
t1=$(get_ultra_rule_str ' Ultra dotfiles installer ' 0 0)

source "$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh"
PS1='⦿ \h [\W\[\e[1;32m\]$(__git_ps1 "(%s)")\[\e[0m\]]\[\e[1;32m\] ▶︎ \[\e[0m\]'
