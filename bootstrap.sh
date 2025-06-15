#!/bin/bash

DOTFILES=$HOME/wsl-dotfiles

sudo apt update && sudo apt upgrade -y && sudo apt install zsh -y
[ ! $(which brew) ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -f "$DOTFILES/Brewfile" ] && brew bundle
[ -f "$DOTFILES/.zshrc" ] && ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
chsh -s $(which zsh)
[ -f "$DOTFILES/.gitconfig" ] && ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
[ -f "$DOTFILES/.gitconfig-cleanroom" ] && ln -nfs $DOTFILES/.gitconfig-cleanroom $HOME/.gitconfig-cleanroom
nvm install --lts && nvm use --lts
[ -d "$DOTFILES/nvim" ] && mkdir -p $HOME/.config && ln -nfs $DOTFILES/nvim $HOME/.config
