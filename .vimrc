if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  endif

execute pathogen#infect()

imap jj <Esc>                                     
iab <expr> dts strftime("%Y/%m/%d %H:%M -")       

"Run scripts directly
nnoremap <leader>r :w<enter>:!"%:p"<enter>

let g:move_key_modifier = 'C'

let g:NERDTreeWinPos = "right"

" [plasticboy/vim\-markdown: Markdown Vim Mode](https://github.com/plasticboy/vim-markdown)
let g:vim_markdown_auto_extension_ext = 'markdown'
" Fold on header 1
let g:vim_markdown_folding_level = 2
let g:vim_markdown_folding_disabled = 1

" Follow links to edit a file with `ge`
"let g:vim_markdown_no_extensions_in_markdown = 1
" Shrink the table of contents"
let g:vim_markdown_toc_autofit = 1

""let g:vim_markdown_folding_disabled = 1

let @r = ""
noremap <c-g> :Goyo<CR>
imap <c-g> <C-O><c-g>

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>b :buffers<CR>:buffer<space>

" Zoom splits
" [Zooming Vim Window Splits Like a Pro](https://medium.com/@vinodkri/zooming-vim-window-splits-like-a-pro-d7a9317d40)
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" Configure taskpaper
let g:task_paper_follow_move = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Set UltiSnipsFolder"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" Some security features
" Change default encryption

" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre *.x set viminfo=
autocmd BufReadPre,FileReadPre *.x set noswapfile
set cm=blowfish

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
""command -nargs=0 -bar Update if &modified 
""                           \|    if empty(bufname('%'))
""                           \|        browse confirm write
""                           \|    else
""                           \|        confirm write
""                           \|    endif
""                           \|endif
""imap wq <Esc>:Update<CR>

syntax on
set number
"set nowrap
set ruler
""set colorcolumn=80
""startinsert
set directory=~/tmp//,/var/tmp//,/tmp//,.

" Autosave taskpaper files                    
" Plugin 'plugin/vim-auto-save' 
" Plugin 'djoshea/vim-autoread'      
" let g:auto_save_events = ["InsertLeave", "TextChanged"]"

let g:auto_save_events = ["CursorHold", "CursorHoldI"]

autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!
"
autocmd filetype markdown let g:auto_save = 1
autocmd filetype markdown :WatchForChanges!


if has('gui_running')
    set background=dark
    colorscheme solarized
""    set guifont=Source\ Code\ Pro:h14
    set guifont=Consolas:h16:cANSI
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
""
""function WordCount()
""    let s:old_status = v:statusmsg
""    exe "silent normal g\<c-g>"
""    let s:word_count = str2nr(split(v:statusmsg)[11])
""    let v:statusmsg = s:old_status
""    return s:word_count
""endfunction
""
""set mouse=a

"" Goyo for distraction free editing
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  ""Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  "Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"" Set up for word processing Markdown files
function! WordProcessorMode()

    iab xtime <c-r>=strftime("%H:%M:%S")<cr>
    iab xdate <c-r>=strftime("%m/%d/%y %H:%M:%S")<cr>

    let g:pencil#wrapModeDefault = 'soft'
    ""setlocal formatoptions=1
    setlocal expandtab
    setlocal tabstop=4
    setlocal shiftwidth=4
    map j gj
    map k gk
    setlocal spell spelllang=en_us
    set thesaurus+=~/.vim/thesaurus/mthesaur.txt
    set complete+=s
    ""setlocal wrap
    ""setlocal linebreak nolist
    ""setlocal foldcolumn=10
    ""set tw=72
    setlocal nonumber
    hi FoldColumn ctermbg=Black ctermfg=Black
    call pencil#init()
    ""set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
    ""set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P
    ""Goyo
endfunction

com! WP call WordProcessorMode()

filetype plugin indent on
""setlocal tabstop=4 shiftwidth=4 expandtab
set tabstop=4 
set shiftwidth=4 
set expandtab
au BufRead * normal zR

autocmd FileType p8 setlocal tabstop=1 shiftwidth=1 noexpandtab
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 shiftwidth=4 expandtab omnifunc=phpcomplete#CompletePHP
""autocmd FileType markdown,md,rst setlocal formatoptions=ant textwidth=72 wrapmargin=0 foldcolumn=10 columns=100 nonumber
autocmd FileType markdown,md,rst WP 

" Inform7
au BufNewFile,BufRead *.ni      setf inform7

"Easier navigations of splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

highlight LineNr ctermfg=darkcyan ctermbg=black
highlight foldcolumn ctermbg=black

""set wrap linebreak nolist
""set tw=72 

:abbr #b /************************************************ 
:abbr #e ************************************************/


""set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
" You will probably have to do a:
" stty -ixon
" so the shell doesn't grab control s
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" highlight the status bar when in insert mode
" (https://github.com/chrishunt/dot-files/)
set laststatus=2
""if version >= 700
""      au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
""      au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
""endif
""
""au BufRead,BufNewFile * startinsert
