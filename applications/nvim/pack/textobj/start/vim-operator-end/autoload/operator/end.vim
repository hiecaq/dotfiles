" File: end.vim
" Author: quinoa42
" Description: functions used as callbacks for the operator end.
" Last Modified: February 23, 2019

let s:op_end_symbol = ';'

function! operator#end#set_symbol(symbol) abort
    let s:op_end_symbol = a:symbol
endfunction

function! s:end_with_symbol(content) abort
    return a:content =~# '\v\s*' . s:op_end_symbol . '\s*$'
endfunction

function! s:pos_new(pos) abort
    let [l:bufnum, l:lnum, l:col, l:off] = a:pos
    return { 'bufnum': l:bufnum, 'lnum': l:lnum, 'col': l:col, 'off': l:off }
endfunction

function! operator#end#toggle(motion_wise) abort
    let l:cursor_position = getpos('.')
    let l:start = s:pos_new(getpos("'["))
    let l:end = s:pos_new(getpos("']"))
    if a:motion_wise ==# "char"
        call s:operator_end_char_toggle(l:start, l:end)
    elseif a:motion_wise ==# "line"
        call s:operator_end_line_toggle(l:start, l:end)
    else " a:motion_wise ==# "block"
        " TODO: need some reasonable behavior
    endif
    call setpos('.', l:cursor_position)
endfunction

function! s:normal(...)
    let l:cmd = ['silent!', 'keepjumps', 'normal!'] + a:000
    execute join(l:cmd)
endfunction

function! s:operator_end_char_toggle(start, end) abort
    if a:start.lnum > a:end.lnum
        return
    endif
    let l:content = getline(a:end.lnum)
    if a:start.lnum == a:end.lnum
        let l:offset = a:start.col
        let l:content = l:content[a:start.col-1:a:end.col-1]
    else
        let l:offset = 0
        let l:content = l:content[:a:end.col-1]
    endif
    call setpos('.', [a:end.bufnum, a:end.lnum, a:end.col, a:end.off])
    if s:end_with_symbol(l:content)
        let l:index = match(l:content, '\v' . s:op_end_symbol . '\s*$')
        call s:normal(string(l:offset + l:index) . '|"_x')
    else
        let l:line = getline(a:end.lnum)
        let l:col = a:end.col - 1
        while l:line[l:col] =~# '\v\s'
            let l:col -= 1
        endwhile
        call s:normal(string(l:col) . '|', 'a' . s:op_end_symbol . "\<esc>")
    endif
endfunction

function! s:operator_end_line_toggle(start, end) abort
    let l:lnum = a:start.lnum
    while l:lnum <= a:end.lnum
        call s:operator_end_char_toggle(
                    \ { 'bufnum': a:start.bufnum, 'lnum': l:lnum, 'col': 1, 'off': 0},
                    \ { 'bufnum': a:start.bufnum, 'lnum': l:lnum, 'col': strlen(getline(l:lnum)), 'off': 0})
        let l:lnum += 1
    endwhile
endfunction
