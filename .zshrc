### PATH
export DOTFILES=~/.dotfiles
export WORKPATH=~/Workspace/
export ZSHCONFIG=$DOTFILES/.zshconfig
export ZSH=/Users/Quinoa/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=vim
export EDITOR=$VISUAL
### fpath=(/usr/local/share/zsh-completions $fpath)
eval "$(rbenv init -)"

### config
source $ZSHCONFIG/.env
source $ZSHCONFIG/.aliases
source $ZSHCONFIG/.keybindings
