getUltraStr() {
  local MINWIDTH=60
  local ULNAMEMAX=$(expr $(tput cols) - 42)

  if [  "$(tput cols)" -lt "$MINWIDTH"  ]
  then
    echo "$(printf "%*s\n" $ULNAMEMAX | tr " " "-")" && return;
  fi

  local ULTRANAMELEN=$1
  local ULTRAWIDTH=$(expr $ULNAMEMAX - ${#ULTRANAMELEN})
  local PADD_L=$(expr $ULTRAWIDTH / 2)
  local PADD_R=$PADD_L

  if [  $(expr $ULTRAWIDTH  % 2) -eq 1 ]
  then
    PADD_R=$(expr $PADD_L + 1)
  fi

  local PADDCHARS_L=$(printf "%*s\n" $PADD_L | tr " " "-")
  local PADDCHARS_R=$(printf "%*s\n" $PADD_R | tr " " "-")
  echo "$PADDCHARS_L$1$PADDCHARS_R"
}
TITLE=`getUltraStr ' ALWAYS RTFMP '` 
ULTRANAME=`getUltraStr " ULTRA $(whoami | sed 's/\.[a-z]*$//' | awk '{print toupper($0)}') "` 
FMN=`getUltraStr ' ✿ '` 
RULE=`getUltraStr ''` 

echo " "
echo "██╗   ██╗██╗  ████████╗██████╗  █████╗  $TITLE"
echo "██║   ██║██║  ╚══██╔══╝██╔══██╗██╔══██╗ $RULE"
echo "██║   ██║██║     ██║   ██████╔╝███████║ $FMN"
echo "██║   ██║██║     ██║   ██╔══██╗██╔══██║ $RULE"
echo "╚██████╔╝███████╗██║   ██║  ██║██║  ██║ $ULTRANAME"
echo " ╚═════╝ ╚══════╝╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ $RULE"
