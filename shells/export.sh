
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec

PATH="$PATH:/usr/X10/bin"
PATH="$PATH:/usr/local/lib/node_modules/karma/bin"
PATH="$PATH:/usr/local/share/npm/bin"
PATH="$PATH:/opt/local/bin"
PATH="$PATH:/usr/local/go/bin"
PATH="$HOME/.cask/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH";
PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$GOROOT/bin

export GREP_OPTIONS="--color=auto"
export CLICOLOR=1
export TERM=xterm-256color
export MC_SKIN="$HOME/.config/mc/jellybean.ini"
export BYOBU_PREFIX="/usr/local"
export EDITOR="vim"

export PROJECT_HOME="$HOME/Project"
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTENV="$HOME/.virtualenvs"
export PYTHONSTARTUP="$HOME/.pystartup"
export NODE_REPL_HISTORY_FILE="$HOME/.node_history";
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL="ignoreboth";
export LESS_TERMCAP_md="${yellow}";
export MANPAGER="less -X";
# export JAVA_HOME="/usr/libexec/java_home"
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

# Path to the bash it configuration
export BASH_IT="$HOME/.dotfiles/shells/bash"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='ultra'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="task"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

  export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
