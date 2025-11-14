apt update && apt upgrade

if ! which zsh > /dev/null; then
    sudo apt-get install zsh
    chsh -s /bin/zsh
fi

if ! which tmux ls > /dev/null; then
    sudo apt-get install tmux
fi

if ! which nvim ls > /dev/null; then
    sudo apt-get install nvim
fi

if ! which fzf ls > /dev/null; then
    sudo apt-get install fzf
    # $(brew --prefix)/opt/fzf/install --all
fi

# needed for mason
if ! which npm ls > /dev/null; then
    sudo apt-get install npm
fi

if ! which uv ls > /dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
