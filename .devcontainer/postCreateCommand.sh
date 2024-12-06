#/bin/bash

echo -e "\nStarting post create command script..."
echo "Dev machine:"
uname -a

git config --global core.autocrlf input
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

omz update
omz plugin load gh npm git-prompt themes python node github pre-commit
omz plugin enable gh npm git-prompt themes python node github pre-commit

# git clone https://github.com/dracula/zsh.git "$ZSH_CUSTOM/themes/dracula"
# ln -s "$ZSH_CUSTOM/themes/dracula/dracula.zsh-theme" "$ZSH_CUSTOM/themes/dracula.zsh-theme"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
omz theme set spaceship

mkdir -p ~/.config
cp .devcontainer/spaceship.zsh ~/.config/spaceship.zsh

bash -c "$(echo "n" | curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

omz reload 

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

omz reload

echo -e "\n*******************************"
echo -e "\nDev container ready!".
echo -e "\n*******************************\n"
