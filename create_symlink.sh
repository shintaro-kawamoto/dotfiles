if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
    echo "move .bashrc .bashrc.bak"
fi
ln -s dotfiles/.bashrc ~/.bashrc

if [ -e ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.bash_profile.bak
    echo "move .bash_profile .bash_profile.bak"
fi
ln -s dotfiles/.bash_profile ~/.bash_profile

if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
    echo "move .vimrc .vimrc.bak"
fi
ln -s dotfiles/.vimrc ~/.vimrc

if [ -e ~/.gvimrc ]; then
    mv ~/.gvimrc ~/.gvimrc.bak
    echo "move .gvimrc .gvimrc.bak"
fi
ln -s dotfiles/.gvimrc ~/.gvimrc

if [ -e ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.bak
    echo "move .gitconfig .gitconfig.bak"
fi
ln -s dotfiles/.gitconfig ~/.gitconfig


