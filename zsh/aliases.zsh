#!/usr/bin/env bash

alias dotter="cd $HOME/.dotfiles && .dotter/dotter"

alias ls='ls --color=auto'
alias lsl='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -lah'
alias l='ls -CF'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pg='ping 8.8.8.8'

alias nvimn='nvim --noplugin -u NONE'             # launch nvim without any plugin or config

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

alias r='. ranger'

alias lg='lazygit'
alias lzd='lazydocker'

alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
