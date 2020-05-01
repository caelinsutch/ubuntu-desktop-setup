#!/bin/bash

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
echo `export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion` >> ~/.zshrc
chsh -s $(which zsh)

echo "Installing Spaceship Prompt"
npm install -g spaceship-prompt

echo "Installing Hyper Terminal and setting as default"
wget https://releases.hyper.is/download/deb
sudo apt install ./hyper_3.0.2_amd64.deb
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50
# Fix to prevent % sign from occuring
echo "unsetopt PROMPT_SP" >> ~/.zshrc

echo "Finished!"
echo "Now what to do: "
echo "1. Install the Ubuntu shell extension: https://extensions.gnome.org/extension/19/user-themes/ (make sure to press the 'click here to install browser extension' button"
echo "2. Open the ubuntu tweaks tool, set your applications appearence to Adwaita-dark, cursor to paper, and icons to paper"
echo "3. Restart your computer by running sudo reboot"
echo "4. Run komorebi"
echo "5. Open ubuntu tweaks tool, select flat-remix as your shell theme"
echo "6. Open a new terminal (should be hyper terminal) and install the following packages using hyper i: hyper-spotify, hypercwd, hyperlinks, hyperline"
echo "6. Celebrate! You're done with installing a basic environment!"
