# rbenv設定
export PATH="$PATH":$HOME/.rbenv/bin
eval "$(rbenv init -)"

# alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -F'
alias ll='ls -lF'
alias la='ls -alF'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# color
export CLICOLOR=1
export LSCOLORS=DxGxcadxCxegedabagacad
