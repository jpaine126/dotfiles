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
        local dest
        if [[ $(basename $file) = .bashrc && $BASH_COMPATIBILITY == true ]]; then
            dest="${DOTFILES_DEST}/.bash_aliases"
        else
            dest=$DOTFILES_DEST
        fi

        ln -svf "${DOTFILES}/${file}" "$dest"
    done

    # link files in specific nested folders
    mkdir -p "${DOTFILES_DEST}/zsh"
    for file in $( ls -Ap ${DOTFILES}/zsh | grep -v / | grep -vE ${exclusion_regex} ) ; do
        ln -svf "${DOTFILES}/zsh/${file}" "$DOTFILES_DEST/zsh"
    done

    mkdir -p "${DOTFILES_DEST}/bash"
    for file in $( ls -Ap ${DOTFILES}/bash | grep -v / | grep -vE ${exclusion_regex} ) ; do
        ln -svf "${DOTFILES}/bash/${file}" "$DOTFILES_DEST/bash"
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

BASH_COMPATIBILITY=false

excludes=()

# Loop through all arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -e)
            shift       # Move to the next argument
            while [[ $# -gt 0 && "$1" != -* ]]; do
                excludes+=("$1")  # Collect items until another flag is found
                shift
            done
            ;;
        -b)
            BASH_COMPATIBILITY=true
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done



# zsh
if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh not installed"
else
    install_links "${excludes[@]}"
    config_git
fi


