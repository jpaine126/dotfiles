# shell b ehavior
setopt NO_HUP
setopt EXTENDED_GLOB
setopt CORRECT
setopt MULTIOS

[ -f $HOME/zsh/.alias ] && source "$HOME/zsh/.alias"
[ -f $HOME/zsh/.dirstack ] && source "$HOME/zsh/.dirstack"
[ -f $HOME/zsh/.history ] && source "$HOME/zsh/.history"
[ -f $HOME/zsh/.completion ] && source "$HOME/zsh/.completion"
[ -f $HOME/zsh/.prompt ] && source "$HOME/zsh/.prompt"

# source local updates
[ -f $HOME/.zshrc.local ] && source "$HOME/.zshrc.local"

# opts
# [[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
# [[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward


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
