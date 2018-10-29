autocmd BufNewFile,BufRead *.cup setf cup
augroup filetype
    au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.config/nvim/syntax/jflex.vim                        
