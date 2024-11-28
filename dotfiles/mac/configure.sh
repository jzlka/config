#!/bin/bash
#   @file       configure.sh
#   @brief      Brief description
#   @author     Jozef Zuzelka <jozef.zuzelka@gmail.com>
#   @date
#    - Created: 10.04.2020 16:14
#    - Edited:  16.12.2021 19:35
#   @version    1.0.0
#   @par        SHELL: zsh 5.7.1 (x86_64-apple-darwin19.0)
#   @bug
#   @todo Download iterm2 integration instead of linking
#          curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash

echo "## Python modules"
sudo pip3 install shodan

echo "## Install Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "# Install zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
echo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

echo "# Import presets to iterm2"
TMP_DIR=$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 8 | head -n 1)
mkdir ~/Downloads/"$TMP_DIR"
git clone https://github.com/mbadolato/iTerm2-Color-Schemes ~/Downloads/"$TMP_DIR/"
echo "iTerm2 presets need to be installed manually. You can find them in ~/Downloads/$TMP_DIR/schemes"
echo -n "Continue?"
read x
rm -rf ~/Downloads/"$TMP_DIR"

echo "# Install powerline fonts"
git clone --depth=1 https://github.com/powerline/fonts.git /tmp/fonts
pushd /tmp/fonts
./install.sh
popd

echo "## Install terminal translator"
git clone https://github.com/soimort/translate-shell /tmp/translate-shell
pushd /tmp/translate-shell
make
cp -i build/trans ~/bin/trans
popd

echo "## Install vim plugins"
echo "Installing latest vundle bundle..."
rm -fr ~/.vim/bundle/Vundle.vim 2>/dev/null
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing other vim bundles..."
vim -N -u ~/.vim/config/bundles.vim +PluginInstall +quitall
echo -n "Print any key to continue "
read x
dir="~/.vim/bundle/YouCompleteMe"

echo "Installing YouCompleteMe"
if [ -r "$dir" ] && [ -d "$dir" ]; then
    pushd "$dir"
    "install.py --clangd-completer"
    popd
fi
echo -n "Print any key to continue "
read x
unset dir


CONFIG=config
echo "## Add slovak language spell checking"
ln -s "${CONFIG}"/misc/hunspell-sk-20110228/sk_SK.* ~/Library/Spelling/

echo "## Make some usefull symlinks"
ln -s "${PWD}/${CONFIG}/konfiguracia.txt" ~/
ln -s "${PWD}/${CONFIG}/arch_prikazy.txt" ~/
sudo ditto "${PWD}/${CONFIG}/"home/Library/Developer/Xcode/Templates/* ~/Library/Developer/Xcode/Templates/
sudo cp "${PWD}/${CONFIG}/"root/etc/hosts /etc/hosts

echo "## oh-my-zsh probably overwritten our zshrc. Fix it"
ln -sf "$PWD/dotfiles/.zshrc" "$HOME"

#echo "## Hide an account"
# https://support.apple.com/en-us/HT203998
#sudo dscl . create /Users/ja IsHidden 1
