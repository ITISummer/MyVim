
"---------------------------------------
"		appearance.vim
"---------------------------------------
"对一些 gvim 显示的一些设置
" 启动 vim 时自动全屏 
au GUIEnter * simalt ~x
" other settings
set number
set cursorline
color darkblue 
set clipboard=unnamed
set cursorline
set noshowmode

" indention
set showtabline=2
set autoindent

" remove the file which is prefixed with ~
set noundofile
set nobackup
set noswapfile

" wrap
set ruler
set linebreak

" search
set ignorecase
set smartcase


" filetype
filetype on
filetype indent on
filetype plugin on

