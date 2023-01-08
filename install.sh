#!/usr/bin/env bash

echo "Jeff's zsh Environment"

source ./zsh/.zshenv

# zsh
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh not installed"
else
    ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
    ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc" 
    ln -sf "$DOTFILES/zsh/.zshrc.alias" "$HOME/.zshrc.alias"
fi

# tmux
if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux not installed"
else
    ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
fi

ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"


# git

git config --global user.name "jpaine126"
git config --global user.email "j.paine126@gmail.com"
git config --global color.ui auto
git config --global init.defaultBranch main

ln -sf "$DOTFILES/.gitignore_global" "$HOME/.gitignore_global"
git config --global core.excludes "$HOME/.gitignore_global"
