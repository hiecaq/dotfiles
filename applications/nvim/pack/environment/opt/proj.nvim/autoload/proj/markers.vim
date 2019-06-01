" ======================================================================== {{{
" File: autoload/proj/markers.vim
" Author: quinoa42
" Description: Markers getter / setters
" Last Modified: 2019-05-28
" License: MIT license
" ======================================================================== }}}

let s:markers = {'_': ['.git']}

function! g:proj#markers#get(ft) abort
    if has_key(s:markers, a:ft)
        return s:markers[a:ft]
    else
        return []
    endif
endfunction

function! g:proj#markers#set(...)
    if a:0 == 1 && type(a:1) == v:t_dict
        call extend(s:markers, a:1)
    elseif a:0 == 2 && type(a:1) == v:t_string && type(a:2) == v:t_list
        let s:markers[a:1] = a:2
    endif
endfunction

" vim: foldenable:foldmethod=marker
