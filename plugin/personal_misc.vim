" Need my modified sgrepin script to sgrep in specified folder
"set grepprg=sgrepin

"nmap <leader>s :grep . <C-R>=expand("<cword>")<CR><CR>
":nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
endfunction

" Need amm script: a wrapper for Android `mm' command, which can also handle
" normal Makefiles
set makeprg=amm

" Learn Vimscript the Hard Way
iabbrev cmarvell Copyright 2014, Marvell Corporation.
" Force to learn no abbreviations
" abbreviat ret return
" abbreviat return NORETURN

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Autocmd test
autocmd BufReadPre *.log setlocal wrap
autocmd BufReadPre *.txt setlocal wrap

autocmd Filetype javascript :abbreviate <buffer> iff if() {<left><left><left><left>
autocmd Filetype python :abbreviate <buffer> iff if :<left>

" Test omap
"onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>

onoremap in< :<c-u>normal! f<vi<<cr>
onoremap il< :<c-u>normal! F>vi<<cr>

" Pending Operator for Markdown '======' title
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

" Pending Operator for Markdown '------' title
onoremap iH :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
onoremap aH :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>

"Snippets
":execute "normal! gg/print\<cr>"

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
