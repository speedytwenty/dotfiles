# vim:ft=ruby

# Cross OS Appplications
#
# These should work pretty much everywhere.
cask "qutebrowser"

# packages
brew "bat" # better cat (syntax highlighting)
brew "cloc" # lines of code counter
brew "corepack"
brew "docker-completion"
brew "entr" # file watcher / command runner
brew "eza" # ls/exa alternative
brew "fd" # find alternative
brew "fish" # fish shell
brew "fnm" # Fast Node version manager
brew "fzf" # Fuzzy file searcher, used in scripts and in vim
brew "gh" # GitHub CLI
brew "git" # Git version control (latest version)
brew "git-delta" # a better git diff
brew "glow" # markdown viewer
brew "gnupg" # GPG
brew "grep" # grep (latest)
brew "highlight" # code syntax highlighting
brew "htop" # a top alternative
brew "jq" # work with JSON files in shell scripts
brew "lazygit" # a better git UI
brew "nb" # cli notes
brew "neofetch" # pretty system info
brew "neovim" # A better vim
brew "pass" # Local CLI password manager.
brew "python" # python (latest)
brew "ripgrep" # very fast file searcher
brew "shellcheck" # diagnostics for shell sripts
brew "starship" # cross-shell prompt
brew "surfraw" # query popular WWW search engines from the cli
brew "tmux" # terminal multiplexer
brew "tree" # pretty-print directory contents
# brew "vim" # Vim (latest)
brew "wdiff" # word differences in text files
brew "wget" # internet file retriever
brew "z" # switch between most used directories
brew "zoxide" # switch between most used directories
brew "zsh" # zsh (latest)
brew "zsh-autosuggestions" # (latest)

# OS Specific
if OS.mac?
  # taps
  tap "homebrew/cask-fonts"
  tap "koekeishiya/formulae"

  brew "noti" # utility to display notifications from scripts
  brew "trash" # rm, but put in the trash rather than completely delete

  # Applications
  cask "kitty" # a better terminal emulator
  cask "docker"
  cask "imageoptim" # a tool to optimize images
  cask "karabiner-elements" # macos keyboard customizer
  brew "musikcube" # terminal music player
  cask "wezterm" # a better terminal emulator

  # yabai
  brew "yabai"
  brew "skhd"

  # Fonts
  cask "font-cascadia-mono"
  cask "font-fira-code"
  cask "font-hack"
  cask "font-jetbrains-mono"
  cask "font-monaspace"
  cask "font-recursive-code"
  cask "font-symbols-only-nerd-font"
  cask "font-ubuntu"
elsif OS.linux?
  brew "xclip" # access to clipboard (similar to pbcopy/pbpaste)
  brew "docker"
end
