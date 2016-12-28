[core]
  autocrlf = input
  excludesfile = ~/.gitignore_global
  excludesfile = ~/.gitignore
  attributesfile = ~/.gitattributes
  # hooksPath = ~/git-hooks
  # insanely beautiful diffs
  pager = bash -lc 'diff-highlight.sh | strip_diff_leading_symbols | less -r'

[color]
  branch = auto
  diff = auto
  interactive = auto
  status = auto
  ui = always

[color "branch"]
  current = yellow reverse
  local = yellow
  remote = green

[color "diff"]
  meta = yellow bold
  frag = magenta bold
  old = red bold
  new = green bold

[color "blame"]
  meta = yellow bold
  frag = magenta bold
  old = red bold
  new = green bold

[color "status"]
  added = yellow
  changed = green
  untracked = cyan

[color "diff-highlight"]
  oldNormal = "red bold"
  oldHighlight = "red bold 52"
  newNormal = "green bold"
  newHighlight = "green bold 22"

[commit]
  template = ~/.dotfiles/git/template.txt

[filter "media"]
  required = true
  clean = git media clean %f
  smudge = git media smudge %f

[filter "lfs"]
  clean = git-lfs clean %f
  smudge = git-lfs smudge %f
  required = true

[filter "hawser"]
  clean = git hawser clean %f
  smudge = git hawser smudge %f
  required = true

[alias]
  ca = commit -am
  cm = commit
  pu = pull
  ps = push
  st = status -s
  co = checkout
  l = log 

 # Show the diff between the latest commit and the current state
  df = diff --color --color-words --abbrev
  d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"
  lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
  # Merge GitHub pull request on top of the `master` branch
  mpr = "!f() { \
    if [ $(printf \"%s\" \"$1\" | grep '^[0-9]\\+$' > /dev/null; printf $?) -eq 0 ]; then \
      git fetch origin refs/pull/$1/head:pr/$1 && \
      git rebase master pr/$1 && \
      git checkout master && \
      git merge pr/$1 && \
      git branch -D pr/$1 && \
      git commit --amend -m \"$(git log -1 --pretty=%B)\n\nCloses #$1.\"; \
    fi \
  }; f"
# Find FIXME, TODO, etc
n = !"git ls-files | xargs notes | awk -F: '{ print $1,$2; print $3,$4; print $5}' | grc conf.notes "

[merge]
  tool = opendiff

[push]
  default = current
