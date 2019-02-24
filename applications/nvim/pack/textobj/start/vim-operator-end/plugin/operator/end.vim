if exists('g:loaded_operator_end')
    finish
endif

call operator#user#define('end-toggle-semicolon', 'operator#end#toggle', 'call operator#end#set_symbol(";")')
call operator#user#define('end-toggle-comma', 'operator#end#toggle', 'call operator#end#set_symbol(",")')

let g:loaded_operator_end = 1
