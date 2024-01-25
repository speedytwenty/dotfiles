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

GREPEXCLUDE_FILES='--exclude="yarn.lock" --exclude="yarn-error.log" --exclude="package-lock.json"'
GREPEXCLUDE_DIRS="--exclude-dir={node_modules,.git,coverage,dist}"
GREPEXCLUDE="$GREPEXCLUDE_DIRS $GREPEXCLUDE_FILES"
# shortcut for grep recursive
alias grepr="grep $GREPEXCLUDE -r"
# shortcut for grep recursive with case insensitivity
alias grepri="grep $GREPEXCLUDE -ri"
