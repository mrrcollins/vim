#!/bin/bash

if [ ! -d ~/.vim/bundle ]; then
	mkdir ~/.vim/bundle
	cd ~/.vim/bundle

    echo "Cloning tlib..."
	git clone --quiet https://github.com/tomtom/tlib_vim.git
    echo "Cloning vim-addon-mw-utils..."
	git clone --quiet https://github.com/MarcWeber/vim-addon-mw-utils.git
    echo "Cloning Ultisnippets..."
	git clone --quiet https://github.com/SirVer/ultisnips.git
    echo "Cloning vim-snippets..."
	git clone --quiet https://github.com/honza/vim-snippets.git
    echo "Cloning vim-puppet..."
	git clone --quiet https://github.com/rodjek/vim-puppet.git
    echo "Cloning nerdtree..."
	git clone --quiet https://github.com/scrooloose/nerdtree.git
    echo "Cloning vim-mads..."
	git clone --quiet https://github.com/skrzyp/vim-mads
    echo "Cloning vim-surround..."
	git clone --quiet https://github.com/tpope/vim-surround.git
    echo "Cloning vim-pencil..."
	git clone --quiet https://github.com/reedes/vim-pencil
    echo "Cloning vim-autoread..."
	git clone --quiet https://github.com/djoshea/vim-autoread.git
    echo "Cloning Goyo..."
	git clone --quiet https://github.com/junegunn/goyo.vim.git
    echo "Cloning vim-markdown..."
	git clone --quiet https://github.com/plasticboy/vim-markdown.git
else
	echo "~/.vim/bundle folder already exists..."
fi

[ ! -L ~/.vimrc ] && ln -s ~/.vim/.vimrc ~/.vimrc || echo "Symlink already exists..."
