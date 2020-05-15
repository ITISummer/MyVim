
" map Nerdtree keymap
"------------------------NerdTree------------------------------------------
nnoremap <silent> <F3> :NERDTreeToggle<Enter>
let nerdtreeminimalui=1
" 让搜寻在此目录下搜寻
let NERDTreeChDirMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
