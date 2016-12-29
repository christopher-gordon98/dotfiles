echo '      __ '
echo '     /  | ALL WAYS RTFMP.'   
echo '    / - |_  _____ ___  ___ ____ ________'
echo '   / __ | |/ / -_\ _ \/ _  / -_) __/ __/'
echo '  / / |_|___/\__/_//_/\__/ \__/_/  /__/ '
echo " /_/  THE AGE OF ULTRA-$(whoami | sed 's/\.[a-z]*$//' | awk '{print toupper($0)}') "

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '

zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '

zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

PS1='> %F{blue}%m%f[%F{yellow}%4~%f]$(vcs_info_wrapper)%F{green}% •--➤ %f '
