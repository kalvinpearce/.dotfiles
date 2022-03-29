#!/usr/bin/env zsh

# Vi mode
bindkey -v
export KEYTIMEOUT=1
# Change cursor
source $ZDOTDIR/plugins/cursor_mode.zsh
# Add Vi text-objects for brackets and quotes
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
# Increment a number
autoload -Uz incarg
zle -N incarg
bindkey -M vicmd '^a' incarg
