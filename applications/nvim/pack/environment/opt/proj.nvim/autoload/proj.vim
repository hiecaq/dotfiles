" ======================================================================== {{{
" File: autoload/proj.vim
" Author: quinoa42
" Description: General user-side functions for proj.nvim
" Last Modified: 2019-05-28
" License: MIT license
" ======================================================================== }}}

function! g:proj#root()
    return _proj_root(expand('%'), &filetype)
endfunction

" vim: foldenable:foldmethod=marker
