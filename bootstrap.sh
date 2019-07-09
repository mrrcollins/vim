#!/bin/bash

if [ ! -d ~/.vim/bundle ]; then
	mkdir ~/.vim/bundle
else
	echo "~/.vim/bundle folder already exists..."
fi

cd ~/.vim/bundle

echo "Attempting to clone tlib..."
[ ! -d tlib_vim ] && git clone --quiet https://github.com/tomtom/tlib_vim.git
echo "Attempting to clone vim-addon-mw-utils..."
[ ! -d vim-addon-mw-utils ] && git clone --quiet https://github.com/MarcWeber/vim-addon-mw-utils.git
echo "Attempting to clone Ultisnippets..."
[ ! -d ultisnips ] && git clone --quiet https://github.com/SirVer/ultisnips.git
echo "Attempting to clone vim-snippets..."
[ ! -d vim-snippets ] && git clone --quiet https://github.com/honza/vim-snippets.git
echo "Attempting to clone vim-puppet..."
[ ! -d vim-puppet ] && git clone --quiet https://github.com/rodjek/vim-puppet.git
echo "Attempting to clone nerdtree..."
[ ! -d nerdtree ] && git clone --quiet https://github.com/scrooloose/nerdtree.git
echo "Attempting to clone vim-mads..."
[ ! -d vim-mads ] && git clone --quiet https://github.com/skrzyp/vim-mads
echo "Attempting to clone vim-surround..."
[ ! -d vim-surround ] && git clone --quiet https://github.com/tpope/vim-surround.git
echo "Attempting to clone vim-pencil..."
[ ! -d vim-pencil ] && git clone --quiet https://github.com/reedes/vim-pencil
echo "Attempting to clone vim-autoread..."
[ ! -d vim-autoread ] && git clone --quiet https://github.com/djoshea/vim-autoread.git
echo "Attempting to clone Goyo..."
[ ! -d goyo.vim ] && git clone --quiet https://github.com/junegunn/goyo.vim.git
echo "Attempting to clone vim-markdown..."
[ ! -d vim-markdown ] && git clone --quiet https://github.com/plasticboy/vim-markdown.git
echo "Attempting to clone vim-move..."
[ ! -d vim-move ] && git clone --quiet https://github.com/matze/vim-move.git

echo "Removing vim-snipmate..."
[ ! -d vim-snipmate ] && rm -Rf vim-snipmate


[ ! -L ~/.vimrc ] && ln -s ~/.vim/.vimrc ~/.vimrc || echo "Symlink already exists..."

cd ~/.vim
