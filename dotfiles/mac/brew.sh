#!/usr/bin/env bash
#   @file       brew.sh
#   @brief      Brief description
#   @author     Jozef Zuzelka <jozef.zuzelka@gmail.com>
#   @date
#    - Created: 10.04.2020 16:14
#    - Edited:  10.04.2020 16:36
#   @version    1.0.0
#   @par        SHELL: zsh 5.7.1 (x86_64-apple-darwin19.0)
#   @bug
#   @todo

## Install Homebrew (if not installed)
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## Make sure we’re using the latest Homebrew.
brew update

## Upgrade any already-installed formulae.
brew upgrade

## Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

brew bundle --file="${PWD}/dotfiles/.brewfile"

# Remove outdated versions from the cellar.
brew cleanup
