#!/usr/bin/env zsh

function source_or_run() {
    url=$3
    dir="$ZDOTDIR/plugins/$1"
    file="$dir/$2"
    if [[ -f $file ]]; then
        source $file
    else
        echo "Downloading $1..."
        eval "git clone -q --depth=1 $url $dir"
        source $file
    fi
}

source_or_run powerlevel10k powerlevel10k.zsh-theme "https://github.com/romkatv/powerlevel10k.git"
source_or_run zsh-autosuggestions zsh-autosuggestions.zsh "https://github.com/zsh-users/zsh-autosuggestions"
source_or_run zsh-syntax-highlighting zsh-syntax-highlighting.zsh "https://github.com/zsh-users/zsh-syntax-highlighting.git"