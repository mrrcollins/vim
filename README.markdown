# My VIM setup

A lot of trial, error, and research has gotten me to the point where I realize how amazing vim is. :-)

# Keypresses

## Taskpaper

	Autocomplete tags - C-x C-n
	Mark task done: \td
	Archive task: \tD
	Search for tags: \ts

## Word Processing

	Synonyms: C-x C-t
	Add word to dictionary: zg
	Lookup misspelled word: lz=

## Show/Hide plug in

	zs - Show all lines containing word under cursor 
    zh - Hide all lines containing word under cursor 
	zn - Open all folds

# Installation:

    git clone https://github.com/mrrcollins/vim.git ~/.vim


## Bundles

    mkdir ~/.vim/bundle
	cd ~/.vim/bundle
    git clone https://github.com/tomtom/tlib_vim.git
    git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
    git clone https://github.com/SirVer/ultisnips.git
    git clone https://github.com/honza/vim-snippets.git
    git clone https://github.com/rodjek/vim-puppet.git
    git clone https://github.com/scrooloose/nerdtree.git
	git clone https://github.com/skrzyp/vim-mads
	git clone https://github.com/tpope/vim-surround.git
    git clone https://github.com/reedes/vim-pencil
    git clone https://github.com/djoshea/vim-autoread.git
    git clone https://github.com/junegunn/goyo.vim.git
    git clone https://github.com/plasticboy/vim-markdown.git
    git clone https://github.com/freitass/todo.txt-vim.git

There is probably a better way, but here is a one-liners stolen from [here](https://coderwall.com/p/rffwva/update-your-vim-pathogen-plugins)to update all of the plugins in `~/.vim/bundle`: 

    for i in ~/.vim/bundle/*; do git -C $i pull; done

# Create symlinks:

    ln -s ~/.vim/.vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

# Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

[Modified from here](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

