" Lazy-load wrappers for opt packages
"
" Description: Set options and packadd on the fly for opt packages on
" invocation of the autoload function.
" Maintainer: quinoa42
" License: MIT {{{
" Copyright © 2019 quinoa42
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the "Software"),
" to deal in the Software without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distribute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
" OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
" OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

let s:loaded_lsp = 0

function! g:lazy#LC_starts()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        setlocal formatexpr=LanguageClient#textDocument_rangeFormatting()
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <Leader>f :call LanguageClient_textDocument_codeAction()<CR>
        nnoremap <buffer> <silent> <Leader>ds :<C-u>Denite documentSymbol<CR>
        nnoremap <buffer> <silent> <Leader>dR :<C-u>Denite references<CR>
        nnoremap <buffer> <silent> <Leader>dS :<C-u>Denite workspaceSymbol<CR>
        nnoremap <buffer> <silent> <Leader>dF :<C-u>Denite contextMenu<CR>
        nnoremap <buffer> <silent> <Leader>R :call LanguageClient#textDocument_rename()<CR>
        if !s:loaded_lsp
            let s:loaded_lsp = 1
            set hidden
            set signcolumn=yes
            packadd LanguageClient-neovim
            LanguageClientStart
        endif
    endif
endfunction

" vim: foldenable:foldmethod=marker

