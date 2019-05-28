" Define mappings
nnoremap <silent><buffer><expr> <CR>
            \ denite#do_map('do_action')
nnoremap <silent><buffer><expr> <c-v>
            \ denite#do_map('do_action', 'preview')
nnoremap <silent><buffer><expr> yy
            \ denite#do_map('do_action', 'yank')
nnoremap <silent><buffer><expr> v
            \ denite#do_map('do_action', 'vsplitswitch')
nnoremap <silent><buffer><expr> s
            \ denite#do_map('do_action', 'splitswitch')
nnoremap <silent><buffer><expr> t
            \ denite#do_map('do_action', 'tabswitch')
" nnoremap <silent><buffer><expr> d
"            \ denite#do_map('do_action', 'delete')
nnoremap <silent><buffer><expr> f
            \ denite#do_map('quick_move')
nnoremap <silent><buffer><expr> <tab>
            \ denite#do_map('choose_action')
nnoremap <silent><buffer><expr> q
            \ denite#do_map('quit')
nnoremap <silent><buffer><expr> <esc>
            \ denite#do_map('quit')
nnoremap <silent><buffer><expr> i
            \ denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> a
            \ denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> V
            \ denite#do_map('toggle_select').'j'
" fill filter line with registers
nnoremap <silent><buffer><expr> p
            \ denite#do_map('filter', getreg('"'))
nnoremap <silent><buffer><expr> <leader>p
            \ denite#do_map('filter', getreg('+'))
