# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias sysvi=vi
alias vi="nvim"
alias gdc="git diff --cached"
alias lg="lazygit"
alias lgs="lazygit stash"
alias lgl="lazygit log"
alias lgb="lazygit branch"

GREPEXCLUDE_FILES='--exclude="yarn.lock" --exclude="yarn-error.log" --exclude="package-lock.json"'
GREPEXCLUDE_DIRS="--exclude-dir={node_modules,.git,coverage,dist}"
GREPEXCLUDE="$GREPEXCLUDE_DIRS $GREPEXCLUDE_FILES"
# shortcut for grep recursive
alias grepr="grep $GREPEXCLUDE -r"
# shortcut for grep recursive with case insensitivity
alias grepri="grep $GREPEXCLUDE -ri"

alias gdc="git diff --cached"

# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

alias lpath='echo $PATH | tr ":" "\n"' # list the PATH separated by new lines

# Applications
alias ios='open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
# remove broken symlinks
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"


# use exa if available
if [[ -x "$(command -v exa)" ]]; then
  alias ll="exa --icons --git --long"
  alias l="exa --icons --git --all --long"
else
  alias l="ls -lah ${colorflag}"
  alias ll="ls -lFh ${colorflag}"
fi
alias la="ls -AF ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"
