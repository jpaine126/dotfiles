#!/usr/bin/env bash

install_links () {
    echo "Installing Jeff's zsh Environment in $DOTFILES into $DOTFILES_DEST"

    default_exclusion_regex='\exclude*|\.git$|\.gitignore|.*.md|.*~$'

    user_exclusion_regex=''
    for excl in $*; do
        user_exclusion_regex+="|${excl}"
    done
    exclusion_regex="${default_exclusion_regex}${user_exclusion_regex}"

    #link folders in base folder
    for file in $( ls -Ap ${DOTFILES} | grep -v / | grep -vE ${exclusion_regex} ) ; do
        ln -svf "${DOTFILES}/${file}" "$DOTFILES_DEST"
    done

    # link files in specific nested folders
    mkdir -p "${DOTFILES_DEST}/zsh"
    for file in $( ls -Ap ${DOTFILES}/zsh | grep -v / | grep -vE ${exclusion_regex} ) ; do
        ln -svf "${DOTFILES}/zsh/${file}" "$DOTFILES_DEST/zsh"
    done

    # link specific files with no pattern
    mkdir -p "${DOTFILES_DEST}/.vim"
    ln -svf "${DOTFILES}/ftplugin" "${DOTFILES_DEST}/.vim"

    source $DOTFILES_DEST/zsh/.functions
    cp_softlink "${DOTFILES}/nvim" "${DOTFILES_DEST}/.config/nvim"
}


config_git () {
    git config --global user.name "jpaine126"
    git config --global user.email "j.paine126@gmail.com"
    git config --global color.ui auto
    git config --global init.defaultBranch main

    ln -sf "$DOTFILES/.gitignore_global" "$DOTFILES_DEST/.gitignore_global"
    git config --global core.excludes "$DOTFILES_DEST/.gitignore_global"
}


# workaround for mac readlink
readlinkf(){ perl -MCwd -e 'print Cwd::abs_path shift' "$1";}
ABSPATH="$(readlinkf ./non-absolute/file)"


export DOTFILES=$(dirname $(dirname $(readlinkf $0)))
export DOTFILES_DEST=$HOME



# zsh
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh not installed"
else
    install_links $*
    config_git
fi


