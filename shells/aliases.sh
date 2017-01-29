#! /usr/local/bin/bash

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."

# ...................................................
# Project specific alias
# ...................................................

# Shortcuts
alias doc="cd ~/Documents"
alias dwl="cd ~/Downloads"
alias dkt="cd ~/Desktop"
alias wk="cd ~/workspace"
alias ghb="cd ~/GITHUB"

alias o="open"

alias a="git add"
alias b="git branch"
alias cm="git commit"
alias co="git checkout"
alias d="git diff | diff-highlight.sh"
alias p="git push"
alias s="git status"

# List all files colorized in long format
alias ls="ls -1 ${colorflag}"

alias week='date +%V'
alias stopwatch='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo pip freeze --local | sudo grep -v '^\-e' | cut -d = -f 1  | sudo xargs -n1 pip install -U'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
  unset jscbin;

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias k="clear && printf '\e[3J'"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

alias showdot="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedot="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

alias dot='cd ~/.dotfiles/'
alias todo='vim ~/.dotfiles/todo/'

alias pxx='vim  ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger'
alias setvw='source /usr/local/bin/virtualenvwrapper.sh'
alias pysrv='python -m SimpleHTTPServer 9000'
alias psrv='php -S localhost:8000'

alias e='emacs'
alias v='vim'

alias srvr='python -m SimpleHTTPServer 9000'

# Unix octal permision table, just a reminder.
# if you intend to mix your own, just be careful
# of who can write and execute file
   # rwx 7
   # rw- 6
   # r-x 5
   # r-- 4
   # -wx 3
   # -w- 2
   # --x 1
   # --- 0
# Change ownership and permission of the current directory recusively
alias myfiles="chown -R  `whoami` ./ && chmod -R 700 ./"

#ghost files, sudo you will need sudo to reset permission 
alias ghosf="chmod -R 000"

# change files or directory permission mode to to all read and ececute
# permission good for scripts
alias xxxf="chmod -R 755"

# change files or directory permission mode to all read 
alias rrrf="chmod -R 744"

# change files or directory permission mode to to all read and
# also allowing the file ower group to write
alias rwrf="chmod -R 764"
