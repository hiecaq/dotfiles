#!/usr/bin/env zsh

### Aliases for directories
alias envconfig="cd $ZSHCONFIG"
alias wp="cd $WORKPATH"
alias dotf="cd $DOTFILES"


### other aliases
alias readme="nvim README.md"
alias v="nvim"
alias vim="nvim"
alias g="git"
alias buildPage="cd $WORKPATH/user-pages; bundle exec jekyll build; cd -"
alias servePage="cd $WORKPATH/user-pages; bundle exec jekyll serve; cd -"