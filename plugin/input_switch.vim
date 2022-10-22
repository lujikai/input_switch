let g:ime_status = 0
autocmd InsertEnter * :silent call jobstart($HOME.'/.config/nvim/plugged/input_switch/s_key.exe '.g:ime_status)
autocmd InsertLeave * :silent call jobstart($HOME.'/.config/nvim/plugged/input_switch/s_get.exe', {'on_stdout': 'TimerCallback', 'stdout_buffered': 1})
function! TimerCallback(j, d, e)
    let g:ime_status = a:d[0]
endfunction
