#!/bin/bash

case "$(uname)" in
	"Darwin")
		if ! command -v brew; then
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi
		brew tap 'homebrew/bundle' && brew bundle install
		brew link --force curl openssl
		;;
	"Linux")
		if ! command -v brew; then
			git clone 'https://github.com/Linuxbrew/brew' ../.brew
			export PATH="../.brew/bin:$PATH"
		fi
		;;
	*) ;;
esac

git clone 'https://github.com/tmux-plugins/tpm' ../.tmux/plugins/tpm
git clone 'https://github.com/syl20bnr/spacemacs' ../.emacs.d

stow --stow --verbose \
	bash          \
	git           \
	scripts       \
	tmux          \
	vim
