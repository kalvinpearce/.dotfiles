#!/usr/bin/env zsh

# # Enable Powerlevel10k instant prompt
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

source $ZDOTDIR/env.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/bindings.zsh
source $ZDOTDIR/plugins.zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ $(tty) != "/dev/tty1" ]] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # Look for an existing tmux session with no clients
  session=$(tmux list-sessions | grep -v attached | awk -F: '{print $1}' | head -n 1)
  if [[ -n "$session" ]]; then
    exec tmux attach-session -t "$session"
  else
    exec tmux new-session
  fi
fi

# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# pnpm
export PNPM_HOME="/home/kalvin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
