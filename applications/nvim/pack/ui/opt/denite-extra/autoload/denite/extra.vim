function! denite#extra#cc(index)
  call timer_start(60, { -> execute('cc! '.a:index)})
endfunction
