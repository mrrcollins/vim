" ============================================================================
" File:        wordcount.vim
" Maintainer:  Miller Medeiros <http://blog.millermedeiros.com/>
" Description: Fast Word and Char count to be used on the statusline.
"              based on Greg Sexton script: http://bit.ly/v3RfAv
" Last Change: 2011-11-10
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================

if &compatible || exists("g:loaded_wordcount_plugin")
    finish
endif
let g:loaded_wordcount_plugin = 1


" set string format
if !exists('g:wc_format')
    let g:wc_format = 'wc:%w/cc:%c'
endif


let s:word_pattern = "\\<\\(\\w\\|-\\|'\\)\\+\\>"


function! s:CountPatternMatch(str, pattern)
    let l:i = 0
    let l:num = -1
    while l:i != -1
        let l:num += 1
        let l:i = matchend(a:str, a:pattern, l:i)
    endwhile
    return l:num
endfunction



function! s:UpdateLineCount()
    let l:wc = s:CountPatternMatch(getline('.'), s:word_pattern)
    let l:cc = strlen(getline('.'))

    let l:line_n = line('.')
    if b:WC_cur_line != l:line_n
        let b:WC_global_wc += b:WC_line_wc - l:wc
        let b:WC_global_cc += b:WC_line_cc - l:cc
        let b:WC_cur_line = l:line_n
    endif
    let b:WC_line_wc = l:wc
    let b:WC_line_cc = l:cc
endfunction



function! s:UpdateGlobalCount()
    " skip current line
    let l:other_lines = []
    if b:WC_cur_line > 1
        let l:other_lines = getline(1, b:WC_cur_line - 1)
    endif
    if b:WC_cur_line < line('$')
        let l:other_lines += getline(b:WC_cur_line + 1, '$')
    endif

    for l:line in l:other_lines
        let b:WC_global_wc += s:CountPatternMatch(l:line, s:word_pattern)
        let b:WC_global_cc += strlen(l:line)
    endfor
endfunction


function! s:ResetVars()
    let b:WC_cur_line = line('.')
    let b:WC_global_wc = 0
    let b:WC_line_wc = 0
    let b:WC_global_cc = 0
    let b:WC_line_cc = 0
endfunction


function! wordcount#statusline()
    if !exists('b:WC_cur_line')
        call s:ResetVars()
        call s:UpdateGlobalCount()
    endif
    call s:UpdateLineCount()
    let l:str = substitute(g:wc_format, '%c', b:WC_global_cc + b:WC_line_cc, 'g')
    let l:str = substitute(l:str, '%w', b:WC_global_wc + b:WC_line_wc, 'g')
    return l:str
endfunction



" --- recalculate when idle and after editing/pasting ---

function! s:RefreshAllCount()
    if !exists('b:WC_cur_line')
        call s:ResetVars()
    endif
    call s:UpdateGlobalCount()
    call s:UpdateLineCount()
endfunction


augroup WC_wc
    autocmd!
    autocmd CursorHold,CursorHoldI,FileChangedShellPost,InsertLeave * call s:RefreshAllCount()
augroup END

