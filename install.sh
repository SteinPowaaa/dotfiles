#!bin/sh
#
# Automates initial config of Solenya's files.

echo "Welcome to Solenya's configation installation script\n"
sleep 1s

echo "\nInstalling packages via apt...\n"
sudo add-apt-repository ppa:kelleyk/emacs -y
sudo apt update
sudo apt install git terminator zsh emacs26 libssl-dev libreadline-dev zlib1g-dev typescript-language-server -y

echo "\nMoving init.el...\n"
mkdir ~/.emacs.d/
cp init.el ~/.emacs.d/

echo "\nMoving .zshrc...\n"
cp .zshrc ~/

echo "\nSetuping jump...\n"
wget https://github.com/gsamokovarov/jump/releases/download/v0.30.1/jump_0.30.1_amd64.deb
sudo dpkg -i jump_0.30.1_amd64.deb

echo "\nSetuping terminal...\n"
chsh -s $(which zsh)
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
# Prevent the script from stopping.
sed -i.tmp 's:env zsh::g' install.sh
sed -i.tmp 's:chsh -s .*$::g' install.sh
sed '111d' install.sh
chmod +x install.sh
./install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

echo "\nInstalling NVM and node...\n"
mkdir ~/.nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node

echo "\nInstalling npm packages...\n"
npm install -g spaceship-prompt # --allow-root --unsafe-perm=true

echo "\nHappy Hacking!\n"