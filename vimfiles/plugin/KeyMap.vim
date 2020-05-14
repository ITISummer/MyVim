
"---------------------------------------
"		keyMap.vim
"---------------------------------------
"主要对一些绑定的快捷键进行记录
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


" map Nerdtree keymap
"------------------------NerdTree------------------------------------------
nnoremap <silent> <F3> :NERDTreeToggle<Enter>
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
