"==========================================
" Author:  wklken
" Version: 6
" Email: wklken@yeah.net
" BlogPost: http://wklken.me
" ReadMe: README.md
" Last_modify: 2013-08-04
" Sections:
"     ->General 基础设置
"     ->Show 展示/排班等界面格式设置
"     ->file encode, 文件编码,格式
"     ->others 其它基础配置
"     ->hot key  自定义快捷键
"     ->bundle 插件管理和配置项
"     ->colortheme 主题,及一些展示上颜色的修改
"==========================================

"==========================================
" General 基础设置
"==========================================

" set autocorrect abbreviations
iab teh the
iab fro for
iab adn and

" Cindent?
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,gs,hs,ps,ts,+s,c3,C0,(2s,us,\U0,w0,m0,j0,)20,*30
"set indentkeys+=*<CR>
"set cinkeys+=*<CR>
"set cindent

" Delete current buffer
noremap <C-D> :bd<CR>
inoremap <C-D> <C-O>:bd<CR>
cnoremap <C-D> <C-C>:bd<CR>

" Save current buffer
noremap <C-E> :w<CR>
inoremap <C-E> <C-O>:w<CR>
cnoremap <C-E> <C-C>:w<CR>

" Close window
noremap <C-X> :q<CR>
inoremap <C-X> <C-O>:q<CR>
cnoremap <C-X> <C-C>:q<CR>

" CTRL-P is switch to Next window, P is on the right
noremap <C-P> :bn<CR>
inoremap <C-P> <C-O>:bn<CR>
cnoremap <C-P> <C-C>:bn<CR>

" CTRL-U is switch to Previous windowa, U is on the left
noremap <C-U> :bp<CR>
inoremap <C-U> <C-O>:bp<CR>
cnoremap <C-U> <C-C>:bp<CR>

" CTRL-G to show detailed file info
" Shows full file name in Normal mode
nnoremap <C-G> 1<C-G>

" Sudo and write to file
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text,tex,docbk setlocal textwidth=80

function! GoDefinition()
    let pos = getpos(".")
    normal! gd
    if getpos(".") == pos
        execute "tag " . expand("<cword>")
    endif
endfunction

" Jump to definition
autocmd FileType c,cpp,java,python,perl nnoremap <C-]> :call GoDefinition()<CR>

" Auto change to working directory
autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

" Todo:
" GoDefinition

" history存储长度。
set history=2000

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=~/bak/vimbk/

" 取消备份。 视情况自己改
set nowritebackup
set nobackup
set noswapfile

" 突出显示当前行等 不喜欢这种定位可注解
"set cursorcolumn
"set cursorline              " 突出显示当前行

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

"- 则点击光标不会换,用于复制
set mouse-=a           " 鼠标暂不启用, 键盘党....
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/排班等界面格式设置
"==========================================

"显示行号：
set number
set nowrap                    " 取消换行。

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

"Smart indent
set smartindent
set autoindent    " always set autoindenting on
"set copyindent

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4             " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格

set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


"行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set number
" autocmd FocusLost * :set number
" autocmd FocusGained * :set relativenumber
" " 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
function! RelativeToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

function! NumberToggle()
  if (&number == 1)
    set nonumber
  elseif (&relativenumber == 1)
    set norelativenumber
  else
    set number
  endif

  " if(&number == 1 or &relativenumber == 1)
  "   set number
  " else
  "   set nonumber
  " endif
endfunc

"create undo file
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/bak/vimundo/
endif

set wildignore=*.swp,*.bak,*.pyc,*.class,*.so,*.swp,*.zip,*.o,*~

"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" Show current mode
set showmode

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=7

"set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

" Vimscript file settings ---------------------- {{{
"==========================================
" file encode, 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
"set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1

set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"language message zh_CN.UTF-8
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! BufWritePost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! BufWritePost .vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt+=longest
set completeopt=longest,menu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files

" if this not work ,make sure .viminfo is writable for you
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  execute "normal! mz"
  %s/\s\+$//ge
  execute "normal! `z"
endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
"hot key  自定义快捷键
"==========================================
let mapleader = ','
let g:mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
"noremap H 0
"noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>

""为方便复制，用<F2>开启/关闭行号显示:
"nnoremap <F2> :set nonumber! number?<CR>
"nnoremap <F3> :set list! list?<CR>
"nnoremap <F4> :set wrap! wrap?<CR>
"              "set paste
"set pastetoggle=<F5>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

"nnoremap <F6> :execute exists('syntax_on') ? 'syn off' : 'syn on'<CR>

map Y y$
" Cancel search highlight key
noremap <silent><leader>/ :nohls<CR>

" Redefine pastetoggle key
nnoremap <leader>p :set invpaste<CR>

" Maps for toggling wrap state
nnoremap <leader>w :set invwrap<CR>

"Line number toggle
nnoremap <leader>N :call RelativeToggle()<cr>
nnoremap <leader>n :call NumberToggle()<CR>

" I can type :help on my own, thanks.
" noremap <F1> <Esc>"

"nnoremap ; :

"Use sane regexes"
" nnoremap / /\v
" vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

""Jump to start and end of line using the home row keys
""
"nmap t o<ESC>k
"nmap T O<ESC>j

" ctrl +jk to move lines   经常敲错换错行...一致没想好配哪个映射
"noremap <C-k> :m+<CR>
"noremap <C-j> :m-2<CR>
"inoremap <C-j> <Esc>:m+<CR>
"inoremap <C-k> <Esc>:m-2<CR>

" Quickly close the current window
"nnoremap <leader>q :q<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
"nnoremap <silent> <leader>d "_d
"vnoremap <silent> <leader>d "_d

"autocmd VimResized * execute "normal! \<c-w>=""

" select all
map <leader>sa ggVG"

function! ToggleExpandTab()
    set expandtab! expandtab?
endfunc

function! SetTabSize(size)
    execute 'set tabstop='.a:size
    execute 'set shiftwidth='.a:size
    execute 'set softtabstop='.a:size
endfunc

map <leader>ts :call ToggleExpandTab()<cr>
map <leader>t2 :call SetTabSize(2)<cr>
map <leader>t4 :call SetTabSize(4)<cr>
map <leader>t8 :call SetTabSize(8)<cr>

" Close the current buffer
"map <leader>bd :Bclose<cr>
"" " Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" tabnext  tabpreviouse

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"==========================================
" bundle 插件管理和配置项
"==========================================
"========================== config for plugins begin ======================================

" 0-bundle the plugins
"package dependent:  ctags
"python dependent:  pep8, pyflake

filetype off " required! turn off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"################### 插件管理 ###################"

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'
" vim plugin bundle control, command model
" :BundleInstall     install
" :BundleInstall!    update
" :BundleClean       remove plugin not in list

"################### 导航 ###################"
"目录导航
Bundle 'scrooloose/nerdtree'
map <leader>d :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"for minibufferexpl
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1

" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
" noremap <leader>bn :MBEbn<CR>
" noremap <leader>bp :MBEbp<CR>
" noremap <leader>bd :MBEbd<CR>

"标签导航
Bundle 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"标签导航 要装ctags
" Bundle 'vim-scripts/taglist.vim'
" set tags=./tags,./TAGS,tags,TAGS,/usr/include/tags,/usr/src/linux/tags
" let Tlist_Ctags_Cmd="/usr/bin/ctags"
" nnoremap <silent> <F8> :TlistToggle<CR>
" let Tlist_Auto_Highlight_Tag = 1
" let Tlist_Auto_Open = 0
" let Tlist_Auto_Update = 1
" let Tlist_Close_On_Select = 0
" let Tlist_Compact_Format = 0
" let Tlist_Display_Prototype = 0
" let Tlist_Display_Tag_Scope = 1
" let Tlist_Enable_Fold_Column = 0
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_File_Fold_Auto_Close = 0
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Hightlight_Tag_On_BufEnter = 1
" let Tlist_Inc_Winwidth = 0
" let Tlist_Max_Submenu_Items = 1
" let Tlist_Max_Tag_Length = 30
" let Tlist_Process_File_Always = 0
" let Tlist_Show_Menu = 0
" let Tlist_Show_One_File = 1
" let Tlist_Sort_Type = "order"
" let Tlist_Use_Horiz_Window = 0
" let Tlist_Use_Right_Window = 0
" let Tlist_WinWidth = 25

"for file search ctrlp, 文件搜索
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>o'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>O :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>f :CtrlPMRU<CR>
nmap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"################### 显示增强 ###################"

"状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'


"括号显示增强
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

"代码排版缩进标识
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>


"主题 solarized
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"主题 molokai
"Bundle 'tomasr/molokai'
"let g:molokai_original = 1

"################### 快速移动 ###################"

"更高效的移动 ,, + w/fx
Bundle 'Lokaltog/vim-easymotion'

Bundle 'vim-scripts/matchit.zip'

"################### 补全及快速编辑 ###################"

"迄今位置用到的最好的自动VIM自动补全插件
"Bundle 'Valloric/YouCompleteMe'
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']


"快速插入代码片段
"Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips", "ultisnips" ]

"快速 加减注释
Bundle 'tpope/vim-commentary'

" 快速加入修改环绕字符
Bundle 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'

"自动补全单引号，双引号等
"Bundle 'Raimondi/delimitMate'
" for python docstring ",优化输入
"autocmd FileType python let b:delimitMate_nesting_quotes = ['"']

"Use easy-align, no need for this
" Bundle 'godlygeek/tabular'
" nmap <leader>a= :Tabularize /=<CR>
" vmap <leader>a= :Tabularize /=<CR>
" nmap <leader>a: :Tabularize /:\zs<CR>
" vmap <leader>a: :Tabularize /:\zs<CR>

"for visual selection
Bundle 'terryma/vim-expand-region'
map + <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

"for mutil cursor
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


"################# 语法检查 ###############

" 编辑时自动语法检查标红, vim-flake8目前还不支持,所以多装一个
" 使用pyflakes,速度比pylint快
" Bundle 'scrooloose/syntastic'
" let g:syntastic_error_symbol='>>'
" let g:syntastic_warning_symbol='>'
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_highlighting = 0
" "let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
" let g:syntastic_python_checkers=['pyflakes']
" highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0


"################# 具体语言语法高亮 ###############

" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" for golang
Bundle 'fatih/vim-go'

" for markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" for javascript
Bundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"for jquery
Bundle 'nono/jquery.vim'

"for jinja2 highlight
Bundle 'Glench/Vim-Jinja2-Syntax'

"for nginx conf file highlight.   need to confirm it works
Bundle 'evanmiller/nginx-vim-syntax'

"################### 其他 ###################"
" task list
"Bundle 'vim-scripts/TaskList.vim'
"map <leader>td <Plug>TaskList

function! HandleKeyUp()
    if &diff
        normal! [c
    else
        GitGutterPrevHunk
    endif
endfunction

function! HandleKeyDown()
    if &diff
        normal! ]c
    else
        GitGutterNextHunk
    endif
endfunction

function! CurLin()
    if v:version >= 700 | setlocal cursorline
    else | normal! zz
    endif
endfun

function! HandleKeyLeft()
    try | cp
    catch | cfirst
    endtry | call CurLin()
endfun

function! HandleKeyRight()
    try | cn
    catch | clast
    endtry | call CurLin()
endfun

" for git 尚未用起来
Bundle 'tpope/vim-fugitive'
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>
map <leader>gc :Gcommit<CR>
map <leader>gs :Gstatus<CR>
map <leader>gr :Gremove<CR>
map <leader>gw :Gwrite<CR>
nnoremap <leader>c "zyiw<C-W>h:Gedit <C-R>z<CR><C-W>l

" Remap arrow keys for special function
map <up>       :call HandleKeyUp()<CR>
map <down>     :call HandleKeyDown()<CR>
map <left>     :call HandleKeyLeft()<CR>
map <right>    :call HandleKeyRight()<CR>

"edit history, 可以查看回到某个历史状态
Bundle 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>

" end turn on
filetype plugin indent on

"========================= Carton added start =====================================
Bundle 'mileszs/ack.vim'
Bundle 'junegunn/vim-easy-align'
vnoremap <leader>l :EasyAlign<CR>

Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/valgrind.vim'
Bundle 'derwiath/csindent.vim'
"Bundle "Carton/vim-snippets"  " Default ultisnips snippets are better

"Linux kernel style
Bundle 'vivien/vim-linux-coding-style'
let g:linuxsty_patterns = [ "/usr/src/", "/linux", "kernel/" ]
nnoremap <silent> <leader>a :LinuxCodingStyle<CR>

"========================= Carton added end =====================================

"========================== config for plugins end ======================================

"==========================================
" 主题,及一些展示上颜色的修改
"==========================================
"开启语法高亮
syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif


" 修改主题和颜色展示
colorscheme solarized
set t_Co=256
set background=dark

"colorscheme desert
"colorscheme molokai

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" settings for kien/rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

