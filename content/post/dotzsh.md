---
title: "Dotzsh"
date: 2015-09-07
tags: ['zsh', ' dotfiles']
slug: dot-zshrc
---
Im Laufe der Jahre gewachsene Zsh-Konfig.

<!--more-->

```
# Enable compsys completion.
bindkey -e
setopt NO_BEEP SHARE_HISTORY HIST_IGNORE_ALL_DUPS
autoload -U compinit
compinit

if [[ -o interactive ]] ; then
	PS1='%(?.[%?].%S[%?]%s)%B%m%b:{%!}%~%# '
	alias l='ls -l'
	#alias ls='ls --color=auto'
fi
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history.zsh
	
#pip only in virtualenv	
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=~/.pip/cache

#
function myssh {
if [[ "x$TMUX" != "x" ]] ; then
 print -P "Ssh to %B$1%b"
 d=$(date '+%s')
 tmux neww -n $1 "script -q logs/$1-$d.log ssh $1"
 else
 print -P "no target given"
fi
}
	
#
# pip zsh completion start
function _pip_completion {
 local words cword
 read -Ac words
 read -cn cword
 reply=( $( COMP_WORDS="$words[*]" \
 COMP_CWORD=$(( cword-1 )) \
 PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
```
Eine Kopie dieser Dateien findt Ihr auf [github].

  [github]: https://github.com/xunzi/dotfiles.git
