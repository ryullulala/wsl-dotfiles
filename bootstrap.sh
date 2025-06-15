#!/bin/bash

DOTFILES=$HOME/wsl-dotfiles


[ ! $(which brew) ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[ -f "$DOTFILES/Brewfile" ] && brew bundle
[ -f "$DOTFILES/.zshrc" ] && ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
[ ! $(which zsh) ] && chsh -s $(which zsh)
[ -f "$DOTFILES/.gitconfig" ] && ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
[ -f "$DOTFILES/.gitconfig-cleanroom" ] && ln -nfs $DOTFILES/.gitconfig-cleanroom $HOME/.config/git/.gitconfig-cleanroom
[ -f "$DOTFILES/nvim" ] && ln -nfs $DOTFILES/nvim $HOME/.config
