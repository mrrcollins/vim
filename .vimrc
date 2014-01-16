execute pathogen#infect()

syntax on
set number
"set nowrap
set ruler
""set colorcolumn=80
""startinsert

if has('gui_running')
    set background=dark
    colorscheme solarized
""    set guifont=Source\ Code\ Pro:h14
    set guifont=DejaVu\ Sans\ Mono\ 12
    set guioptions-=r   "Don't show right scroll bar
    set guioptions-=T  "remove toolbar"
endif

""set mouse=a

filetype plugin indent on
""setlocal tabstop=4 shiftwidth=4 expandtab
set tabstop=4 
set shiftwidth=4 
set expandtab

autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 shiftwidth=4 expandtab omnifunc=phpcomplete#CompletePHP

highlight LineNr ctermfg=darkcyan ctermbg=black

""set wrap linebreak nolist
""set tw=72 

