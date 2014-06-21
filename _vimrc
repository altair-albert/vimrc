
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set mouse=a         "鼠标可用
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
" personal setting
" 设置通用缩进策略
set shiftwidth=4
set tabstop=4
set smarttab
set cursorline
"主题设置
colorscheme molokai
set guifont=Consolas:h11
set guifontwide=Consolas:h11

set showtabline=2
set formatoptions=tcrqn      " 自动格式化代码
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set laststatus=2             " 开启状态栏信息
set cmdheight=1              " 命令行的高度，默认为1，这里设为2
set writebackup              " 设置无备份文件
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮竖线代替，尾部空白使用高亮点号代替
set listchars=tab:\|\ ,trail:.
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set showmatch                "show pattern
set clipboard+=unnamed       "共享剪贴板"
filetype on                  "文件类型检测
"更加丰富美观的状态栏
set go-=T                       "关闭工具栏"
set go-=r                       "关闭滚动条"
set ambiwidth=double            "防止特殊符号不能显示"

"打开文件时自动跳转的上次编辑的位置
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal g'\"" | endif
endif

" 设置文件编码和文件格式
set fileformats=dos,unix,mac
set encoding=utf-8
set termencoding=utf-8 
set fileencodings=utf-8,chinese,latin-1 
if has("win32") 
    set fileencoding=chinese 
else 
    set fileencoding=utf-8 
endif 

"  解决菜单乱码
set langmenu=zh_CN
let $LANG= 'zh_CN.UTF-8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" ======= 引号 && 括号自动匹配 ======= "

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

" assuming you want to use snipmate snippet engine
filetype off 
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Bundle 'gmarik/vundle' 
Bundle "MarcWeber/vim-addon-mw-utils"

Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Optional:
Bundle "honza/vim-snippets"

Bundle "Lokaltog/vim-powerline"
call vundle#end()
filetype plugin indent on
" +y/ +p使用系统剪切板,Gvim不常用,linux的vim需要安装gvim才能使用,linux很有用
vmap <c-w>	"+y
vmap <c-v>	"+p
function ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction

set guitablabel=%{ShortTabLabel()}
