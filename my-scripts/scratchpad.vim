" Useful macros to place in vimrc
" Build the current module using :make

function GetModuleRoot()
	let mods = ":p:h"
	let dir = expand( "%" . mods )
	while !filereadable( dir . "/Makefile" ) && !filereadable( dir . "/prj/build.lst" ) && dir != "/"
		let mods .= ":h"
		let dir = expand( "%" . mods )
	endwhile
	return dir
endfunction

if $SOLARENV != ""
	" Define the make tool
	let module = GetModuleRoot()
	if filereadable( module . "/Makefile" )
		set makeprg=make\ -sr\ -j10\ debug=t
	else
		set makeprg=build.pl\ debug=true\ -P10\ --\ -P10
	endif
endif

" Note: A more sophisticated version is available as http://cgit.freedesktop.org/libreoffice/contrib/dev-tools/tree/vim_scripts/vimrc_make
" Show the issue in a browser

" Of course this function would need to be hacked if firefox isn't the browser to be used, and new prefixes can be added. To use this function, simply place the cursor on a bug reference in the code like i#12345 and hit Ctrl+i.

" Get the issue number under the cursor. An issue number is containing
" digits, lating letters and #. The # characters are removed from the result.
" 
" Code heavily inspired from the words_tools.vim of Luc Hermitte
" http://hermitte.free.fr/vim/ressources/dollar_VIM/plugin/words_tools_vim.html
function! GetCurrentIssueText()
	let c = col ('.')-1
	let l = line('.')
	let ll = getline(l)
	let ll1 = strpart(ll,0,c)
	let ll1 = matchstr(ll1,'[0-9#a-zA-Z]*$')
	if strlen(ll1) == 0
		return ll1
	else
		let ll2 = strpart(ll,c,strlen(ll)-c+1)
		let ll2 = strpart(ll2,0,match(ll2,'$\|[^0-9#a-zA-Z]'))
		let text = ll1.ll2

		let text = substitute( text, "#", "", "g" )
		return text
	endif
endfunction


" Open IssueZilla / Bugzilla for the selected issue
function! OpenIssue( )

	let s:browser = "firefox"

	let s:issueText = GetCurrentIssueText( )
	let s:urlTemplate = ""
	let s:pattern = "\\(\\a\\+\\)\\(\\d\\+\\)"

	let s:prefix = substitute( s:issueText, s:pattern, "\\1", "" )
	let s:id = substitute( s:issueText, s:pattern, "\\2", "" )

	if s:prefix == "i"
		let s:urlTemplate = "http://openoffice.org/bugzilla/show_bug.cgi?id=%"
	elseif s:prefix == "n"
		let s:urlTemplate = "https://bugzilla.novell.com/show_bug.cgi?id=%"
	elseif s:prefix == "fdo"
		let s:urlTemplate = "https://bugs.freedesktop.org/show_bug.cgi?id=%"
	endif

	if s:urlTemplate != ""
		let s:url = substitute( s:urlTemplate, "%", s:id, "g" )
		let s:cmd = "silent !" . s:browser . " " . s:url . "&"
		execute s:cmd
	endif
endfunction

map <silent> <C-i> :call OpenIssue()<CR><C-l>

" Show the current function name

" To use this function, simply hit f: the line containing the function name will be displayed.

function! ShowFuncName()
	let lnum = line(".")
	let col = col(".")
	echohl ModeMsg
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
	echohl None
	call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction
map f :call ShowFuncName() <CR>

