#!/bin/bash

if [ ! -d ~/.vim/bundle ]; then
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
else
	echo "~/.vim/bundle folder already exists..."
fi

ln -s ~/.vim/.vimrc ~/.vimrc
