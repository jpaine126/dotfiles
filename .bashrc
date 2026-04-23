[ -f $HOME/bash/.alias ] && source "$HOME/bash/.alias"
[ -f $HOME/bash/.dirstack ] && source "$HOME/bash/.dirstack"
[ -f $HOME/bash/.history ] && source "$HOME/bash/.history"
[ -f $HOME/bash/.completion ] && source "$HOME/bash/.completion"
[ -f $HOME/bash/.prompt ] && source "$HOME/bash/.prompt"
[ -f $HOME/bash/.functions ] && source "$HOME/bash/.functions"

# source local updates
[ -f $HOME/.bashrc.local ] && source "$HOME/.bashrc.local"

[ -f $HOME/.local/bin/env ] && source $HOME/.local/bin/env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
