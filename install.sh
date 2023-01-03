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

