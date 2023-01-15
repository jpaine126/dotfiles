source "$DOTFILES/zsh/.zshrc.alias"

# prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST

empty_style='%{%K{none}%}%{%F{none}%}'

bg_blue='%{%K{blue}%}'
bg_green='%{%K{green}%}'

text_green='%{%F{green}%}'

NAMEMACHINE='${empty_style}${bg_blue}%n@%m${empty_style}'
GITSTUFF='${empty_style}${bg_green}$(parse_git_branch)${empty_style}'
CURRPATH='${empty_style}${text_green}%~${empty_style}'
ENDSYMBOL='${empty_style}>'

PROMPT="$NAMEMACHINE$GITSTUFF $CURRPATH $ENDSYMBOL "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jpaine/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jpaine/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jpaine/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jpaine/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
