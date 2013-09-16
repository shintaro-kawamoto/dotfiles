# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# rbenv設定
if [ -e ~/.rbenv ]; then
    export PATH="$PATH":$HOME/.rbenv/bin
    eval "$(rbenv init -)"
fi

# nodebrew設定
if [ -e ~/.nodebrew ]; then
    export PATH="$PATH":$HOME/.nodebrew/current/bin
fi

# alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

case "${OSTYPE}" in
darwin*)
    alias ls='ls -G'
    alias ll='ls -lF'
    alias la='ls -alF'
    ;;
linux*)
    alias ls='ls --color'
    alias ll='ls -lF'
    alias la='ls -alF'
    ;;
esac

case "`uname`" in
    Darwin) # OSがMacの場合
        if [ -d /Applications/MacVim.app ]; then # MacVimが存在する場合
            alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
            alias vi='vim'
        fi
        ;;
    *) # OSがMac以外の場合は何もしない
        ;;
esac

# color
#export CLICOLOR=1
export LSCOLORS=DxGxcadxCxegedabagacad
