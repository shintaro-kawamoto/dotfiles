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
set noundofile

colorscheme desert

filetype off

if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#rc(expand('~/.vim/bundle/'))
endif
    " originalrepos on github
NeoBundle 'Shougo/neobundle.vim' 
NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'osyo-manga/vim-over'
"NeoBundle 'mattn/zencoding-vim'
 
filetype plugin indent on     " required!
filetype indent on
syntax on
