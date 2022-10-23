function! IsWSL()
  if has("unix")
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
      return 1
    endif
  endif
  return 0
endfunction

if has("win32") || IsWSL()
    let g:ime_status = 0
    let s:plugindir = expand('<sfile>:p:h:h')
    autocmd InsertEnter * :silent call jobstart(s:plugindir.'/s_key.exe '.g:ime_status)
    autocmd InsertLeave * :silent call jobstart(s:plugindir.'/s_get.exe', {'on_stdout': 'TimerCallback', 'stdout_buffered': 1})
    function! TimerCallback(j, d, e)
        let g:ime_status = a:d[0]
    endfunction
endif
