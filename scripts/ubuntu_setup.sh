apt update && apt upgrade

if ! which zsh > /dev/null; then
    sudo apt-get install zsh
    chsh -s /bin/zsh
fi

if ! which tmux ls > /dev/null; then
    sudo apt-get install tmux
fi

if ! which nvim > /dev/null; then
    sudo apt-get install nvim
fi

if ! which fzf > /dev/null; then
    sudo apt-get install fzf
fi
