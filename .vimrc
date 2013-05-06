set autoindent
set backupdir=$HOME/vimbackup
set nocompatible
set directory=$HOME/vimbackup
set expandtab
set incsearch
set number
set showmatch
set smarttab
set tabstop=4
set shiftwidth=4
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

filetype off

if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#rc(expand('~/.vim/bundle/'))
endif
    " originalrepos on github
NeoBundle 'Shougo/neobundle.vim' 
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'mattn/zencoding-vim'
 
filetype plugin indent on     " required!
filetype indent on
syntax on
