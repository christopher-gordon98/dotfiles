getUltraStr() {
  MINWIDTH=60
  ULNAMEMAX=$(expr $(tput cols) - 43)

  if [  "$(tput cols)" -lt "$MINWIDTH" ]
  then
    echo "$(printf "%*s\n" $ULNAMEMAX | tr " " "-")" && return;
  fi

  ULTRANAMELEN=$1
  PADD="$(expr $(expr $ULNAMEMAX - ${#ULTRANAMELEN}) / 2)"
  PADDCHARS="$(printf "%*s\n" $PADD | tr " " "-")"
    echo "$PADDCHARS$1$PADDCHARS"
  }
  TITLE=`getUltraStr ' ALL WAYS RTFMP '` 
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
