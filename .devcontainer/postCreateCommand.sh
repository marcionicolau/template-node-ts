#/bin/bash

echo -e "\nStarting post create command script..."
echo "Dev machine:"
uname -a
echo -e "\nInstalling biome..."
sudo chown node node_modules
npm install --save-dev --save-exact @biomejs/biome 
sudo apt update

omz update
omz plugin load gh npm git-prompt themes python node github pre-commit
omz plugin enable gh npm git-prompt themes python node github pre-commit

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
omz theme set spaceship

mkdir -p ~/.config
cp .devcontainer/spaceship.zsh ~/.config/spaceship.zsh

echo -e "\n*******************************"
echo -e "\nDev container ready!".
echo -e "\n*******************************\n"
