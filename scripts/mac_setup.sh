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
