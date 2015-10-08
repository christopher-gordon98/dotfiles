[user]
        name = Goshine
        email = greenlig@gmail.com
[core]
        excludesfile = /Users/Gato/.gitignore_global
        autocrlf = input
[color]
        branch = auto
        diff = auto
        interactive = auto
        status = auto
[filter "media"]
        required = true
        clean = git media clean %f
        smudge = git media smudge %f
[difftool "sourcetree"]
        cmd = opendiff \"$LOCAL\" \"$REMOTE\"
        path = 
[mergetool "sourcetree"]
        cmd = /Applications/SourceTree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
        trustExitCode = true
[filter "lfs"]
        clean = git-lfs clean %f
        smudge = git-lfs smudge %f
        required = true


[alias]

      c = commit -am
      pu = pull
      ps = push
      st = status -s
      df = diff --color --color-words --abbrev
      lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
      l = log 
      co = checkout

      # Show the diff between the latest commit and the current state
      d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"

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



[color]
    ui = always

[core]
      excludesfile = ~/.gitignore
      attributesfile = ~/.gitattributes
      # insanely beautiful diffs
#      pager = bash -lc 'diff-highlight | strip_diff_leading_symbols | less -r' -
[color "branch"]
      current = yellow reverse
      local = yellow
      remote = green
[color "diff"]
      meta = yellow bold
      frag = magenta bold
      old = red bold
      new = green bold
[color "status"]
      added = yellow
      changed = green
      untracked = cyan
[merge]
    tool = opendiff


[color "diff-highlight"]
      oldNormal = "red bold"
      oldHighlight = "red bold 52"
      newNormal = "green bold"
      newHighlight = "green bold 22"

[push]
    default = current
