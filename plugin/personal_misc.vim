" Need my modified sgrepin script to sgrep in specified folder
set grepprg=sgrepin

nmap <leader>s :grep . <C-R>=expand("<cword>")<CR><CR>

" Need amm script: a wrapper for Android `mm' command, which can also handle
" normal Makefiles
set makeprg=amm

" Learn Vimscript the Hard Way
iabbrev cmarvell Copyright 2014, Marvell Corporation.

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Autocmd test
autocmd BufReadPre *.log setlocal wrap
autocmd BufReadPre *.txt setlocal wrap

autocmd Filetype javascript :abbreviate <buffer> iff if() {<left><left><left><left>
autocmd Filetype python :abbreviate <buffer> iff if :<left>

" Force to learn no abbreviations
abbreviat ret return
abbreviat return NORETURN
