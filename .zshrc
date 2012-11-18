# 補完機能
autoload -U compinit
compinit

# 文字コード
export LANG=ja_JP.UTF-8

# 色
autoload colors
colors

# 色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32' 
