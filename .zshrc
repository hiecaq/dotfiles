### PATH
export DOTFILES=~/.dotfiles
export ZSHCONFIG=$DOTFILES/.zshconfig
export ZSH=/Users/Quinoa/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=vim
export EDITOR=$VISUAL

### config
source $ZSHCONFIG/.env
source $ZSHCONFIG/.aliases
source $ZSHCONFIG/.keybindings
