let mapleader = ","
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

" 设置调整窗口大小的快捷键
map <up> :res+5<CR>
map <down> :res-5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 设置快速开启拼写检查快捷键, 加 ! 的原因是同一个快捷键可以起开启和关闭的作用
map <LEADER>sc :set spell!<CR>
