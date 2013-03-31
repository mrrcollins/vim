I created the repository and pushed it up to Github. :-)

Installation:

    git clone https://github.com/mrrcollins/vim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

[Modified from here](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

