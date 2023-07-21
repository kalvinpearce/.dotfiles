#!/usr/bin/env bash

alias dotter="cd $HOME/.dotfiles && .dotter/dotter"

# ls alias check if exa is installed, if not, use ls
alias ls='ls --color=auto'
if command -v exa &> /dev/null; then
  alias exa='exa --color=always'
  alias la="exa -lah"
else
  alias la="la -lah"
fi

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pg='ping 8.8.8.8'

alias n="nvim"
alias nvimn='nvim --noplugin -u NONE'             # launch nvim without any plugin or config

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

alias r='. ranger'

alias lg='lazygit'
alias lzd='lazydocker'

alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

alias pn='pnpm'
