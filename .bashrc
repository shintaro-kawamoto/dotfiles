# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# git
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    export PS1='[\[\033[01;32m\]\u@\h\[\033[01;33m\] \w\[\033[31m\]$(__git_ps1)\[\033[00m\]]\n\[\033[01;34m\]\$ \[\033[00m\]'
else 
    export PS1='[\[\033[01;32m\]\u@\h\[\033[01;33m\] \w\[\033[00m\]]\n\[\033[01;34m\]\$ \[\033[00m\]'
fi

# rbenv
if [ -e ~/.rbenv ]; then
    export PATH="$PATH":$HOME/.rbenv/bin
    eval "$(rbenv init -)"
fi

# nodebrew
if [ -e ~/.nodebrew ]; then
    export PATH="$PATH":$HOME/.nodebrew/current/bin
fi

case "${OSTYPE}" in
darwin*) # for mac
    alias ls='ls -GF'

    # vim
    if [ -d /Applications/MacVim.app ]; then
        alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias vi='vim'
    fi

    # java
    if [ -e /Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home ]; then
        export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
        export PATH="$PATH":$JAVA_HOME/bin
    fi
    ;;
linux*) # for linux
    alias ls='ls --color -F'
    ;;
*) # other
    ;;
esac

# alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lF'
alias la='ls -alF'
alias lv='ls -avF'
if [ -f ~/bin/ssh-host-color ]; then
    alias ssh=~/bin/ssh-host-color
fi

# go
export GOPATH=$HOME/go
export PATH="$PATH":$GOPATH/bin
#case "${OSTYPE}" in
#linux*) # for linux
#    ;;
#*) # other
#    ;;
#esac


# color
#export CLICOLOR=1
export LSCOLORS=DxGxcadxCxegedabagacad
