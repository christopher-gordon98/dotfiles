source $HOME/.dotfiles/shells/functions.sh

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
