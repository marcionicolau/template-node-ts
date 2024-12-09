#/bin/bash

echo -e "\nStarting post create command script..."
echo "Dev machine:"
uname -a

git config --global user.email "marcio.nicolau@inf.ufrgs.br"
git config --global user.name "Marcio Nicolau"
git config --global core.autocrlf input

omz update

ZSH_CUSTOM="$ZSH/custom"
echo $ZSH
echo $ZSH_CUSTOM

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

omz plugin load gh npm git-prompt themes python node github pre-commit
omz plugin enable gh npm git-prompt themes python node github pre-commit

# Install biomejs
mkdir -p "$HOME/.local/bin"
curl -L https://github.com/biomejs/biome/releases/download/cli%2Fv1.9.4/biome-linux-x64 -o "$HOME/.local/bin/biome"
chmod +x "$HOME/.local/bin/biome"

mkdir -p ~/.config
cp .devcontainer/spaceship.zsh ~/.config/spaceship.zsh

omz theme set spaceship

bash -c "$(echo "Y" | curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

omz reload

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

omz reload

echo -e "\n*******************************"
echo -e "\nDev container ready!".
echo -e "\n*******************************\n"
