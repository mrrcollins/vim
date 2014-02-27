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

""function! WordCount()
""    let s:old_status = v:statusmsg
""    let position = getpos(".")
""    exe ":silent normal g\"
""    let stat = v:statusmsg
""    let s:word_count = 0
""    if stat != '--No lines in buffer--'
""    let s:word_count = str2nr(split(v:statusmsg)[11])
""    let v:statusmsg = s:old_status
""    end
""    call setpos('.', position)
""    return s:word_count 
""endfunction"

""function WordCount()
""    let s:old_status = v:statusmsg
""    exe "silent normal g\<c-g>"
""    let s:word_count = str2nr(split(v:statusmsg)[11])
""    let v:statusmsg = s:old_status
""    return s:word_count
""endfunction

""set mouse=a

filetype plugin indent on
""setlocal tabstop=4 shiftwidth=4 expandtab
set tabstop=4 
set shiftwidth=4 
set expandtab
au BufRead * normal zR

autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 shiftwidth=4 expandtab omnifunc=phpcomplete#CompletePHP

highlight LineNr ctermfg=darkcyan ctermbg=black

""set wrap linebreak nolist
""set tw=72 

""set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
