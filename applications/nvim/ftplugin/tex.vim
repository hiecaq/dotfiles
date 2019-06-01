" FileType: tex

let g:vimtex_view_method = "zathura"
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_use_temp_files = 1
let g:vimtex_quickfix_mode = 0
let g:tex_conceal='abdmg'

let g:vimtex_compiler_latexmk = {
            \ 'backend' : "nvim",
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-shell-escape',
            \ ],
            \}
