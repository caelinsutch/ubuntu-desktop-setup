#!/bin/bash

echo "Moving hyper config somewhere safe"
cp ./.hyper.js ~/Downloads

echo "Installing Chrome..."

cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

cd ~

echo "--------------"
echo "STARTING TOOLS"
echo "--------------"

echo "Installing git"
sudo apt-get install git

echo "Installing NVM and setting default to latest version"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.bashrc
nvm install node
nvm alias default node


echo "Installing Ubuntu Tweaks"
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install chrome-gnome-shell

echo "Installing Paper Icons"
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt-get update
sudo apt install paper-icon-theme

echo "Install Flat Remix Theme"
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt-get update
sudo apt-get install flat-remix

cd ~/Downloads
echo "Install Komorobei"
wget https://github.com/cheesecakeufo/komorebi/releases/download/v2.1/komorebi-2.1-64-bit.deb
sudo apt install ./komorebi-2.1-64-bit.deb

echo "Installing ZSH and Ohmyzsh and setting to default"
sudo apt-get install zsh
sh -c $(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM" >> ~/.zshrc
chsh -s $(which zsh)

echo "Installing Spaceship Prompt"
npm install -g spaceship-prompt

echo "Installing Hyper Terminal and setting as default"
sudo apt-get install gdebi
wget https://releases.hyper.is/download/deb
sudo gdebi deb
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50
# Fix to prevent % sign from occuring
echo "unsetopt PROMPT_SP" >> ~/.zshrc
rm ~/.hyper.js
mv ~/Downloads/.hyper.js ~/.hyper.js

echo "Installing fonts"
cd ~/Downloads
wget https://github.com/tonsky/FiraCode/releases/download/3.1/FiraCode_3.1.zip
unzip FiraCode_3.1.zip
mkdir ~/.local/share/fonts
cp ttf/* ~/.local/share/fonts
fc-cache -f -v

echo "Finished!"
echo "Now what to do: "
echo "1. Install the Ubuntu shell extension: https://extensions.gnome.org/extension/19/user-themes/ (make sure to press the 'click here to install browser extension' button"
echo "2. Open the ubuntu tweaks tool, set your applications appearence to Adwaita-dark, cursor to paper, and icons to paper"
echo "3. Restart your computer by running sudo reboot"
echo "4. Run komorebi"
echo "5. Open ubuntu tweaks tool, select flat-remix as your shell theme"
echo "6. Celebrate! You're done with installing a basic environment!"
