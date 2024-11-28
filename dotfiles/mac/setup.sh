#!/usr/bin/env bash
#   @file       setup.sh
#   @brief      Brief description
#   @author     Jozef Zuzelka <jozef.zuzelka@gmail.com>
#   @date
#    - Created: 10.04.2020 16:14
#    - Edited:  16.12.2021 18:49
#   @version    1.0.0
#   @par        SHELL: zsh 5.7.1 (x86_64-apple-darwin19.0)
#   @bug
#   @todo

xcode-select --install
echo "Wait for installation to finish. Then press any key to continue.."
read x

echo "Accepting Xcode license"
sudo xcodebuild -license accept

echo -n "Do you want to install Rosetta 2? [Y/n] "
read x
[[ $x =~ ^[Yy]$ ]] && sudo softwareupdate --install-rosetta

# Install apps and binaries with Brew
echo -n "Do you want to install brew tools? [Y/n] "
read x
[[ $x =~ ^[Yy]$ ]] && dotfiles/mac/brew.sh

# Applications that need to be installed manually
dotfiles/mac/apps.sh

# Create symlinks for dotfiles
echo -n "Do you want to link dotfiles? [Y/n] "
read x
[[ $x =~ ^[Yy]$ ]] && dotfiles/link-dotfiles.sh

# Configure various system things
echo -n "Do you want to configure system? [Y/n] "
read x
[[ $x =~ ^[Yy]$ ]] && dotfiles/mac/configure.sh

# Configure MacOS defaults.
# You only want to run this once during setup. Additional runs may reset changes you make manually.
echo -n "Do you want to set defaults? [Y/n] "
read x
[[ $x =~ ^[Yy]$ ]] && dotfiles/mac/macos.sh
