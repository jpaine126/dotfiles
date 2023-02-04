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