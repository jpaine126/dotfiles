source "$DOTFILES/zsh/.zshrc.alias"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST

PROMPT='%{%K{blue}%}%n%{%K{none}%} %{%F{green}%}%~%{%F{none}%}%{%K{green}%}$(parse_git_branch)%{%K{none}%} > '

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
