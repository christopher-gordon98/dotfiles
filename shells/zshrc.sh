source $HOME/.dotfiles/shells/zprompt.sh
source $HOME/.dotfiles/shells/export.sh
source $HOME/.dotfiles/shells/aliases.sh 
source $HOME/.dotfiles/shells/functions.sh
source $HOME/.dotfiles/shells/ssh.sh
source $HOME/.localenv.sh

autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

autoload -Uz promptinit
promptinit
