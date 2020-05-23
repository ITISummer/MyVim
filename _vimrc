"   _     __     __    _     __     __  _   ____        __     __             __  __   
"  |"|    \ \   /"/u  |"|    \ \   /"/u|"| / __"| u     \ \   /"/u  ___     U|' \/ '|u 
"U | | u   \ \ / // U | | u   \ \ / // |_|<\___ \/       \ \ / //  |_"_|    \| |\/| |/ 
" \| |/__  /\ V /_,-.\| |/__  /\ V /_,-.   u___) |       /\ V /_,-. | |      | |  | |  
"  |_____|U  \_/-(_/  |_____|U  \_/-(_/    |____/>>     U  \_/-(_/U/| |\u    |_|  |_|  
"  //  \\   //        //  \\   //           )(  (__)      //   .-,_|___|_,-.<<,-,,-.   
" (_")("_) (__)      (_")("_) (__)         (__)          (__)   \_)-' '-(_/  (./  \.)  




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

" config file position
source $VIMRUNTIME/vimrc_example.vim

"---------------------------------------
"		keyMap.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\KeyMap.vim


"---------------------------------------
"		appearance.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\appearance.vim


"---------------------------------------
"		encoding.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\encoding.vim


"---------------------------------------
"		fonts.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\fonts.vim

"---------------------------------------
"		Nerdtree.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\Plugin_Nerdtree.vim

"---------------------------------------
"		ctrlp.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\Plugin_ctrlp.vim

"---------------------------------------
"		surround.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\Plugin_surround.vim


"---------------------------------------
"		repeat.vim
"---------------------------------------
source F:\Vim\vimfiles\plugin\Plugin_repeat.vim




" --------------------------自定义部分----------------------------------------


" --------------------------插件安装----------------------------------------
call plug#begin('F:\Vim\vimfiles\plugged')

Plug 'vim-airline/vim-airline' " beauty the status bar
Plug 'preservim/nerdtree' " display file tree in the directory
Plug 'ctrlpvim/ctrlp.vim' " search file via file name 
Plug 'tpope/vim-surround' " support 'ys' 'ds' command
Plug 'tpope/vim-repeat'   " the plugin surround's complementary plugin
" Plug 'tomtom/tcomment_vim' " strengthen the comment function, can use 'ctrl+/'
" Plug 'Valloric/YouCompleteMe' " code-completion

call plug#end()
" --------------------------插件安装----------------------------------------



