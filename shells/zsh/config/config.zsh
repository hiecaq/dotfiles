#!/usr/bin/env zsh

#######################################################################
#                              Oh-My-Zsh                              #
#######################################################################

ZSH_THEME="pygmalion"
plugins=(git colorize pip python brew osx tmux zsh-syntax-highlighting vi-mode gem tmuxinator)
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
    # copy & paste & adapted from https://github.com/jez/vim-superman
    if [ $# -eq 0 ]; then
        echo "What manual page do you want?";
    elif ! man -d "$@" &> /dev/null; then
        # Check that manpage exists to prevent visual noise.
        echo "No manual entry for $*"
    else
        nvim -c "Man $*" -c "silent only"
    fi
}

compdef vman="man"

#######################################################################
#                                proxy                                #
#######################################################################
mproxy() {
    if [[ $1 = "ss" ]]; then
        export http_proxy="socks5://127.0.0.1:1080"
        export https_proxy="socks5://127.0.0.1:1080"
    elif [[ $1 = "unset" ]]; then
        unset http_proxy https_proxy
    else
        echo "USAGE: $0 <ss|unset>"
    fi
}
#######################################################################
#                                 fzf                                 #
#######################################################################

# colorscheme
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
}
_gen_fzf_default_opts

# use ag instead of find by default (and shows hidden files)
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# preview window for long command
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"

#######################################################################
#                               source                                #
#######################################################################

source ~/.aliases
source $ZSHCONFIG/keybindings.zsh
# source $ZSHCONFIG/tmuxinator.zsh
