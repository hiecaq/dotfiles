#!/usr/bin/env zsh

### Setting
export KEYTIMEOUT=10

#######################################################################
#                              Oh-My-Zsh                              #
#######################################################################

ZSH_THEME="pygmalion"
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx tmux zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

unalias pip

#######################################################################
#                      Zsh-syntax-hightlighting                       #
#######################################################################

source $ZSHCONFIG/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

#######################################################################
#                            Vim SuperMan                             #
#######################################################################

vman() {
    nvim -c "Man $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

compdef vman="man"

#######################################################################
#                               source                                #
#######################################################################

source $ZSHCONFIG/aliases.zsh
source $ZSHCONFIG/keybindings.zsh

