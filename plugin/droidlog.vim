"
" Android logcat hl syntax. for both logcat and logcat -v threadtime. Tony
"

function! HighlightLogcat()
	hi def LogF_color ctermfg=white guifg=white ctermbg=red guibg=red
	hi def LogE_color ctermfg=darkred guifg=darkred
	hi def LogW_color ctermfg=brown guifg=brown
	hi def LogI_color ctermfg=blue guifg=blue
	hi def LogD_color ctermfg=green guifg=green
	hi def LogV_color ctermfg=gray guifg=gray

	" Support for kmsg mixed logcat in threadtime output
	syn match LogF  '^\(F \+\|F\/\|\(.*\[ *[0-9\.]\+\].*\)\?[0-9:\.\- ]* \+F \+\|[0-9:\.\- ]* \+F\/\).*'
	syn match LogE  '^\(E \+\|E\/\|\(.*\[ *[0-9\.]\+\].*\)\?[0-9:\.\- ]* \+E \+\|[0-9:\.\- ]* \+E\/\).*'
	syn match LogW  '^\(W \+\|W\/\|\(.*\[ *[0-9\.]\+\].*\)\?[0-9:\.\- ]* \+W \+\|[0-9:\.\- ]* \+W\/\).*'
	syn match LogI  '^\(I \+\|I\/\|\(.*\[ *[0-9\.]\+\].*\)\?[0-9:\.\- ]* \+I \+\|[0-9:\.\- ]* \+I\/\).*'
	syn match LogD  '^\(D \+\|D\/\|\(.*\[ *[0-9\.]\+\].*\)\?[0-9:\.\- ]* \+D \+\|[0-9:\.\- ]* \+D\/\).*'
	syn match LogV  '^\(V \+\|V\/\|\(.*\[ *[0-9\.]\+\].*\)\?[0-9:\.\- ]* \+V \+\|[0-9:\.\- ]* \+V\/\).*'

	hi def link LogF LogF_color
	hi def link LogE LogE_color
	hi def link LogW LogW_color
	hi def link LogI LogI_color
	hi def link LogD LogD_color
	hi def link LogV LogV_color
endfunction

autocmd BufRead *.log,*.txt call HighlightLogcat() 
