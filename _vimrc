" Vim with all enhancements

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction












" --------------------------自定义部分----------------------------------------


" 禁止显示菜单和工具条,并绑定到快捷键F2 
set guioptions-=m 
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
	
" F11 为Vim全屏切换快捷键 
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" 在插入模式下也设置F11全屏 
imap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" 启动 vim 时自动全屏 
au GUIEnter * simalt ~x

" set the file encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" other settings
set number
set cursorline
color darkblue 
set clipboard=unnamed
set cursorline
set noshowmode

" fonts
"-----------------------------air_line-------------------------------------
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"  endif

"  " unicode symbols
"  let g:airline_left_sep = '»'
"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
"  let g:airline_right_sep = '◀'
"  let g:airline_symbols.linenr = '␊'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.branch = '⎇'
"  let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'
"------------------------------------------------------------------

" map Nerdtree keymap
"------------------------NerdTree------------------------------------------
nnoremap <silent> <F3> :NERDTreeToggle<Enter>
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" indention
set showtabline=2
set autoindent

" config file position
source $VIMRUNTIME/vimrc_example.vim

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
" --------------------------自定义部分----------------------------------------


" --------------------------插件安装----------------------------------------
call plug#begin('F:\Vim\vimfiles\plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
call plug#end()
" --------------------------插件安装----------------------------------------





