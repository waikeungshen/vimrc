"安装插件:
":BundleInstall
"更新插件:
":BundleInstall!
"卸载不在列表中的插件:
":BundleClean

"""""管理插件、安装插件""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'a.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'flazz/vim-colorschemes'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'python-syntax'
Bundle 'mrtazz/DoxygenToolkit'
Bundle 'syntastic'
"Bundle 'davidhalter/jedi-vim'
Bundle 'Yggdroot/indentLine'
Bundle 'airblade/vim-gitgutter'

"vundle配置必须开启插件
filetype plugin indent on


""""""""""""""快捷键设定"""""""""""""""
""""""""""""""""一般设定"""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""基本设定""""""""""""""
" 不要使用vi的键盘模式，而是vim自己的 
set nocompatible 
"set cursorline " 突出当前行
" 设定默认编码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

set completeopt=longest,menu 

" 控制台响铃
set noerrorbells
set novisualbell

set vb t_vb=
set showcmd " 显示正在输入的命令
set number " 显示行号
set nobackup " 不要备份文件
" 不要生成swap文件，当buffer被丢弃的时候隐藏它 
setlocal noswapfile 
set bufhidden=hide 
set cmdheight=2 " 命令行(在状态行下)的高度，默认为1
set linespace=0 " 字符间插入的像素行数目
set wildmenu " 增强模式中的命令行自动完成操作

filetype on " 侦测文件类型
filetype indent on " 为特定文件类型载入相关缩进文件 
filetype plugin indent on "启用自动补全
syntax on " 语法高亮
set confirm " 在处理未保存或只读文件的时候，弹出确认
set showtabline=1   "设置标签栏的显示，0永远不显示 1两个以上显示 2 永远显示
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离

"在状态行上显示光标所在位置的行号和列号 
set ruler 
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%) 

" 我的状态行显示的内容（包括文件类型和解码） 
set statusline=%f\ %<%h%m%r\ [TYPE=%Y]\ [FORMAT=%{&ff}]\ %=%-14.(%l,%v%)\ %P
set laststatus=2 " 总是显示状态行

"""""""""搜索与匹配""""""""
set showmatch " 高亮显示匹配的括号
set matchtime=5 " 匹配括号高亮的时间（单位是十分之一秒） 
set ignorecase " 在搜索时忽略大小写
set incsearch " 在搜索时，输入的词句的逐字符高亮
"""""""""文本格式和排版"""""""""
set formatoptions=tcrqn " 自动格式化
set autoindent " 继承前一行的缩进方式，特别适用于多行注释
set tabstop=4 " 制表符为4
set expandtab " 用空格代替制表符
set wrap
set smartindent " 为C程序提供自动缩进
set cindent " 使用C样式的缩进
" 统一缩进为4 
set softtabstop=4 
set shiftwidth=4 

" 折叠设置
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>
set foldcolumn=0    " 折叠区域的宽带
setlocal foldlevel=99    " 折叠层数
set foldmethod=syntax

"配色方案
""colorscheme desert
"colorscheme molokai
""colorscheme elflord
if has("gui_running")
    "set background=light
    "let g:solarized_termcolors=256
    "colorscheme solarized
    colorscheme molokai
    set guifont=Monaco:h10
else
    set background=dark
    "set background=light
    colorscheme solarized
endif

""""GUI"""""""""""
set guioptions-=r
set guioptions-=L


"""""""""""""""""""""""根据不同类型文件的不同设置""""""""""""""""""
" Python
function InsertPythonHeadComment()
    call setline(1, "#! /usr/bin/env python")
    call setline(2, "# _*_ coding:utf-8 _*_")

    normal G
    normal o
    normal o
endfunction
autocmd bufnewfile *.py call InsertPythonHeadComment()

"""""""""插件配置区""""""""""
"Powerline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256	   " Explicitly tell Vim that the terminal supports 256 colors. show colored statusline.
let g:Powerline_symbols='unicode'
let g:Powerline_stl_path_style = 'full'

" NerdTree
map <F3> : NERDTreeToggle<CR>
let NERDTreeWinSize=30
"let NERDTreeQuitOnOpen=1
let NERDChristmasTree=1
let NERDTreeWinPos='left'
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$', '\.swp$']

"Tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=30
let g:tagbar_autofocus=1

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_global_ycm_extra_conf'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   “按,jd 会跳转到定义
let g:ycm_enable_diagnostic_signs=1
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1 " 语法关键字补全
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_complete_in_comments = 1 " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
"let g:ycm_filetype_whitelist = {
"            \'c':1,
"            \'cpp':1,
"            \'php':1,
"            \'python':1,
"            \}
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"DoxygenToolkit
let g:DoxygenTookit_briefTag_pre="@Synopsis "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Return "
let g:DoxygenToolkit_authorName="waikeungshen"
let s:licenseTag="Copyright(C)\<enter>"
let s:licenseTag=s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag=s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
"let g:doxygen_enhanced_color=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_balloons = 1

let g:syntastic_objc_compiler = "clang"
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1

let g:syntastic_objc_compiler = "clang"
let g:syntastic_objc_check_header = 1
let g:syntastic_objc_auto_refresh_includes = 1


" indentLine
" Vim
let g:indentLine_color_term = 239
"GVim
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '¦'

"python-syntax
let python_highlight_all = 1
