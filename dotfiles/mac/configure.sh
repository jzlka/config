#!/bin/bash
#   @file       configure.sh
#   @brief      Brief description
#   @author     Jozef Zuzelka <jozef.zuzelka@gmail.com>
#   @date
#    - Created: 10.04.2020 16:14
#    - Edited:  15.05.2020 21:37
#   @version    1.0.0
#   @par        SHELL: zsh 5.7.1 (x86_64-apple-darwin19.0)
#   @bug
#   @todo Download iterm2 integration instead of linking
#          curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash

## Python modules
sudo pip3 install shodan

## Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-~/.oh-my-zsh}/themes/powerlevel10k"

# Import presets to iterm2
# https://github.com/mbadolato/iTerm2-Color-Schemes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes /tmp/iTerm2-Color-Schemes
echo "iTerm2 presets need to be installed manually. You can find them in /tmp/iTerm2-Color-Schemes/schemes"
echo -n "Continue?"
read x

# Install powerline fonts
git clone --depth=1 https://github.com/powerline/fonts.git /tmp/fonts
pushd /tmp/fonts
./install.sh
popd

## Install terminal translator
git clone https://github.com/soimort/translate-shell /tmp/translate-shell
pushd /tmp/translate-shell
make
cp -i build/trans ~/bin/trans
popd

## Install vim plugins
echo "Installing latest vundle bundle..."
rm -fr "${HOME}/.vim/bundle/Vundle.vim" 2>/dev/null
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
echo "Installing other vim bundles..."
vim -N -u "${HOME}/.vim/config/bundles.vim" +PluginInstall +quitall
echo -n "Print any key to continue "
read x
dir="~/.vim/bundle/YouCompleteMe"
echo -n "Installing YouCompleteMe"
[ -r "$dir" ] && [ -d "$dir" ] && cd "$dir" && "install.py --clangd-completer"
cd -
unset dir
echo -n "Print any key to continue "
read x


CONFIG=config
## Add slovak language spell checking
ln -s "${CONFIG}"/misc/hunspell-sk-20110228/sk_SK.* Library/Spelling/

## Make some usefull links
ln -s /Volumes/Data/Skola/FIT\ VUT/ "${HOME}/FIT"
ln -s "${PWD}/${CONFIG}/konfiguracia.txt" "${HOME}/"
ln -s "${PWD}/${CONFIG}/arch_prikazy.txt" "${HOME}/"
sudo ditto "${PWD}/${CONFIG}/"home/Library/Developer/Xcode/Templates/* "${HOME}/"Library/Developer/Xcode/Templates/
sudo cp "${PWD}/${CONFIG}/"root/etc/hosts /etc/hosts

## Hide an account
# https://support.apple.com/en-us/HT203998
#sudo dscl . create /Users/ja IsHidden 1
