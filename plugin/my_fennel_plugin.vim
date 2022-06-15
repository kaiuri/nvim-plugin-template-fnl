if exists('g:my_fennel_plugin') || !has('nvim')
    finish
endif
let g:my_fennel_plugin = 1

function! s:load(...)
    for buf in nvim_list_bufs()
        call luaeval('require("my_fennel_plugin").config(_A)', buf)
    endfor
    autocmd! my_fennel_plugin BufNewFile,BufRead,BufFilePost * lua require('my_fennel_plugin').config()
endfunction

augroup my_fennel_plugin
    if v:vim_did_enter
        call s:load()
    else
        autocmd VimEnter * ++nested call s:load()
    endif
augroup END
