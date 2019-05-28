" Define mappings
nnoremap <silent><buffer><expr> <C-]>
            \ defx#do_action('open_directory')
nnoremap <silent><buffer><expr> <C-i>
            \ defx#do_action('open_directory')
nnoremap <silent><buffer><expr> o
            \ defx#do_action('open_or_close_tree')
nnoremap <silent><buffer><expr> C
            \ defx#do_action('toggle_columns',
            \                'mark:filename:type:size:time')
nnoremap <silent><buffer><expr> S
            \ defx#do_action('toggle_sort', 'time')
nnoremap <silent><buffer><expr> <cr>
            \ defx#do_action('multi', ['drop', 'quit'])
nnoremap <silent><buffer><expr> V
            \ defx#do_action('toggle_select')
nnoremap <silent><buffer><expr> v
            \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
nnoremap <silent><buffer><expr> s
            \ defx#do_action('multi', [['drop', 'split'], 'quit'])
nnoremap <silent><buffer><expr> t
            \ defx#do_action('multi', ['quit', ['drop', 'tabedit']])
nnoremap <silent><buffer><expr> d
            \ defx#do_action('multi', [['call', 'wrapper#DeniteFileRec'], 'quit'])
nnoremap <silent><buffer><expr> yy
            \ defx#do_action('yank_path')
nnoremap <silent><buffer><expr> .
            \ defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> <C-o>
            \ defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> ~
            \ defx#do_action('cd')
nnoremap <silent><buffer><expr> q
            \ defx#do_action('quit')
nnoremap <silent><buffer><expr> <Esc>
            \ defx#do_action('quit')
nnoremap <silent><buffer><expr> j
            \ line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k
            \ line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> <C-g>
            \ defx#do_action('print')
nnoremap <silent><buffer><expr> D
            \ defx#do_action('change_vim_cwd')
