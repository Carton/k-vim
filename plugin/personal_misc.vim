" Need my modified sgrepin script to sgrep in specified folder
set grepprg=sgrepin

nmap <leader>s :grep . <C-R>=expand("<cword>")<CR><CR>

" Need amm script: a wrapper for Android `mm' command, which can also handle
" normal Makefiles
set makeprg=amm
