# Vim dotfiles

    git submodule init
    git submodule update
    ln -s $(pwd)/.vim $HOME/.vim
    ln -s $(pwd)/.vimrc $HOME/.vimrc
    ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
    ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
