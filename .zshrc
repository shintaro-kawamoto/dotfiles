# prompt
PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
RPROMPT="%T"
setopt transient_rprompt
setopt prompt_subst
bindkey -e
#bindkey -v
export LANG=ja_JP.UTF-8
export EDITOR=vim

autoload colors
colors

# 補完
autoload -U compinit
compinit -u
setopt correct
setopt correct_all

# path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# go
export GOPATH=$HOME/go
export PATH="$PATH":$GOPATH/bin
export PATH="$PATH":/usr/local/go/bin

# renv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
 
# 履歴
HISTFILE=~/.zsh_history
HISTFILESIZE=1000000
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_reduce_blanks
 
# alias
alias vi=vim
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias ll="ls -lF"
alias la="ls -alF"
alias lv="ls -avF"

# peco
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
       BUFFER="cd ${selected_dir}"
       zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^@' peco-src
 
[ -f ~/.zshrc.include ] && source ~/.zshrc.include

