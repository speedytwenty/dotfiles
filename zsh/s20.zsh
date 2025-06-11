#!/usr/bin/env bash

# Use vi mode https://koenwoortman.com/zsh-vim-mode/
bindkey -v
export KEYTIMEOUT=1

export ZSH_DISABLE_COMPFIX=true

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# https://askubuntu.com/questions/413436/copy-current-terminal-prompt-to-clipboard
copy_line_to_clipboard() {
    echo -n "$BUFFER" | pbcopy
    printf "\ncopied line to clipboard:\n%s" "$BUFFER"
    zle reset-prompt
}

zle -N copy_line_to_clipboard
bindkey '^Y' copy_line_to_clipboard
