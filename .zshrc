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

