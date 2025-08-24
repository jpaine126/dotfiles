# install homebrew
if ! which brew --help > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade


if ! which zsh > /dev/null; then
    brew install zsh
    chsh -s /usr/local/bin/zsh
fi

if ! which tmux ls > /dev/null; then
    brew install tmux
fi

if ! which nvim ls > /dev/null; then
    brew install nvim
fi

if ! which fzf ls > /dev/null; then
    brew install fzf
    $(brew --prefix)/opt/fzf/install --all
fi

# needed for mason
if ! which npm ls > /dev/null; then
    brew install npm
fi

if ! which uv ls > /dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi


