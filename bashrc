set -o vi
# fix spelling errors for cd, only in interactive shell

if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

export VISUAL=nvim
export EDITOR=$VISUAL

export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="~/.pyenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# prompt setting
export PS1="\[\e[35m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]\[\e[31m\]:\[\e[m\]\[\e[36m\]\w\[\e[m\] \[\e[31m\]\\$\[\e[m\]  "

# ls setting

source ~/.zsh/aliases
alias ls="ls --color=auto"
