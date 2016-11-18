#!/usr/bin/env zsh

source $ZSHCONFIG/aliases.zsh
source $ZSHCONFIG/keybindings.zsh
#######################################################################
#                              Oh-My-Zsh                              #
#######################################################################

ZSH_THEME="pygmalion"
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx tmux zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#######################################################################
#                      Zsh-syntax-hightlighting                       #
#######################################################################

source $ZSHCONFIG/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

### Setting
export KEYTIMEOUT=10


#######################################################################
#                            Vim SuperMan                             #
#######################################################################

vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

compdef vman="man"
