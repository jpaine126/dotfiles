#!/usr/bin/env bash

echo "Jeff's zsh Environment"

source ./.zshenv

# zsh

ln -sf "$DOTFILES/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc" 


# tmux

ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
