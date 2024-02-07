# My VIM setup

A lot of trial, error, and research has gotten me to the point where I realize how amazing vim is. :-)

**Perquisites**: Vim requires Python support or Ultisnips gets angry. With Ubuntu try installing vim-gtk:

    sudo apt install vim-gtk

Under OpenBSD try `vim-nox`

**I jump between** Linux, Unix, and macOS accounts and use this install out of the box. 

# Config

* Searches ignore case
* Autosave is turned on for todo, taskpaper, and Markdown files
* Tabs are expanded. Ruby is 2 spaces, Python and PHP is 4.
* Word processing mode turned on for .markdown, .md, and .rst files

# Keys

The leader key is set to `\`.

* `S` - Highlight text and hit S, next character will surround the text. For left/right characters ({}/[]/()) use the left one to add a space and then the character or the right one to just add the character.
* `c-j` & `c-k` - Move lines or blocks of text up and down
* `jk`/`kj` - Escape out of edit mode
* `dts<space>` - Expands to `%Y/%m/%d %H:%M - `
* `e<tab>` - Ultisnip to insert current date/time (`%Y/%m/%d %H:%M`). The advantage of this is that the date is select so you can change it and use `c-j` to go to the hour and then minute to change them. I use it to backdate entries in my [Journal](https://www.gozgeek.com/posts/2021/2021-05-21-journal-my-plain-text-journey-part-iv/).
* `<space><space>` - [Derek Sivers tip on writing each line separately](https://sive.rs/1s). Two spaces will put a . and a return. Markdown doesn't care about lines with a single return, it will put them all in a paragraph until it see two returns. Except for Wordpress, it sees each return as a new paragraph.
* `\r` - Save the current script and run it.
* `c-g` - Turns on distraction free writing with Goyo.
* `c-n` - Opens Nerdtree on the right

Look below for keys specific to certain tasks.

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

If you already have a ~/.vim, you'll want to rename or move it.

    git clone https://github.com/mrrcollins/vim.git ~/.vim

And for the bold after cloning:

    cd ~/.vim
    bash bootstrap.sh

The scripts sets everything up and clones the plugins. It won't overwrite anything that already exists.

If you use the bootstrap.sh you can ignore the rest. Well, except for the one liner to update the Vim plugins in `~/.vim`.

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
    git clone https://github.com/ConradIrwin/vim-bracketed-paste

There is probably a better way, but here is a one-liners stolen from [here](https://coderwall.com/p/rffwva/update-your-vim-pathogen-plugins)to update all of the plugins in `~/.vim/bundle`: 

    for i in ~/.vim/bundle/*; do git -C $i pull; done

# Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

# Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

[Modified from here](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

