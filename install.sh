#!/usr/bin/env bash

echo "Jeff's zsh Environment"

source ./zsh/.zshenv

# zsh

ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc" 


# tmux

ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
