#!/usr/bin/env bash

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
	echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
	echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
	echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
	exit 1
}

warning() {
	echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
	echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
	echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

get_linkables() {
	find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

uninstall_symlinks() {
	title "Uninstalling symlinks"

	for file in $(get_linkables); do
		target="$HOME/.$(basename "$file" '.symlink')"
		if [ -L "$target" ]; then
			info "~${target}#${HOME}"
		fi
	done

  return
}

uninstall_git() {
	title "Setting up Git"

	defaultName=$(git config user.name)
	defaultEmail=$(git config user.email)
	defaultGithub=$(git config github.user)

	read -rp "Name [$defaultName] " name
	read -rp "Email [$defaultEmail] " email
	read -rp "Github username [$defaultGithub] " github

	git config -f ~/.gitconfig-local user.name "${name:-$defaultName}"
	git config -f ~/.gitconfig-local user.email "${email:-$defaultEmail}"
	git config -f ~/.gitconfig-local github.user "${github:-$defaultGithub}"

	if [[ "$(uname)" == "Darwin" ]]; then
		git config --global credential.helper "osxkeychain"
	else
		read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
		if [[ $save =~ ^([Yy])$ ]]; then
			git config --global credential.helper "store"
		else
			git config --global credential.helper "cache --timeout 3600"
		fi
	fi
}

uninstall_homebrew() {
	title "Setting up Homebrew"

	if test ! "$(command -v brew)"; then
		info "Homebrew not installed. Installing."
		# Run as a login shell (non-interactive) so that the script doesn't pause for user input
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
	fi

	if [ "$(uname)" == "Linux" ]; then
		test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
		test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
		test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
	fi

	# install brew dependencies from Brewfile
	brew bundle

	# install fzf
	echo -e
	info "Installing fzf"
	"$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
}

uninstall_shell() {
	title "Configuring shell"

	[[ -n "$(command -v brew)" ]] && zsh_path="$(brew --prefix)/bin/zsh" || zsh_path="$(which zsh)"
	if ! grep "$zsh_path" /etc/shells; then
		info "adding $zsh_path to /etc/shells"
		echo "$zsh_path" | sudo tee -a /etc/shells
	fi

	if [[ "$SHELL" != "$zsh_path" ]]; then
		chsh -s "$zsh_path"
		info "default shell changed to $zsh_path"
	fi
}

uninstall_macos() {
	title "Configuring macOS"
	if [[ "$(uname)" == "Darwin" ]]; then

		echo "Finder: show all filename extensions"
		defaults write NSGlobalDomain AppleShowAllExtensions -bool true

		echo "show hidden files by default"
		defaults write com.apple.Finder AppleShowAllFiles -bool false

		echo "only use UTF-8 in Terminal.app"
		defaults write com.apple.terminal StringEncodings -array 4

		echo "expand save dialog by default"
		defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

		echo "show the ~/Library folder in Finder"
		chflags nohidden ~/Library

		echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
		defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

		echo "Enable subpixel font rendering on non-Apple LCDs"
		defaults write NSGlobalDomain AppleFontSmoothing -int 2

		echo "Use current directory as default search scope in Finder"
		defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

		echo "Show Path bar in Finder"
		defaults write com.apple.finder ShowPathbar -bool true

		echo "Show Status bar in Finder"
		defaults write com.apple.finder ShowStatusBar -bool true

		echo "Disable press-and-hold for keys in favor of key repeat"
		defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

		echo "Set a blazingly fast keyboard repeat rate"
		defaults write NSGlobalDomain KeyRepeat -int 1

		echo "Set a shorter Delay until key repeat"
		defaults write NSGlobalDomain InitialKeyRepeat -int 15

		echo "Enable tap to click (Trackpad)"
		defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

		# from https://gist.github.com/brandonb927/3195465/
		echo "Privacy: Don't send search queries to Apple"
		defaults write com.apple.Safari UniversalSearchEnabled -bool false
		defaults write com.apple.Safari SuppressSearchSuggestions -bool true

		echo "Enable Safari’s debug menu"
		defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

		echo "Kill affected applications"

		for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
	else
		warning "macOS not detected. Skipping."
	fi
}

case "$1" in
backup)
	backup
	;;
link)
	uninstall_symlinks
	;;
git)
	uninstall_git
	;;
homebrew)
	uninstall_homebrew
	;;
shell)
	uninstall_shell
	;;
macos)
	uninstall_macos
	;;
all)
	uninstall_symlinks
	uninstall_homebrew
	uninstall_shell
	uninstall_git
	uninstall_macos
	;;
*)
	echo -e $"\nUsage: $(basename "$0") {unlink|homebrew|macos|all}\n"
	exit 1
	;;
esac

echo -e
success "Done."
