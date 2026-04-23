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
[ -f $HOME/zsh/.functions ] && source "$HOME/zsh/.functions"

# source local updates
[ -f $HOME/.zshrc.local ] && source "$HOME/.zshrc.local"

[ -f $HOME/.local/bin/env ] && source $HOME/.local/bin/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
