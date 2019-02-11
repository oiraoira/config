set nocompatible
execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')
"source $userprofile/vimfiles/autotag.vim

set nowrap
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=88
if has("gui_running")
    set lines=80
    set columns=89
endif
set matchtime=20
set tags=./tags
set tags+=/mnt/Data2/Sandbox/Trunk/tags
set tags+=/mnt/Data2/Sandbox/Python/gosha/tags
set autoindent
filetype indent on
set guifont=Monospace\ 8
syntax on
map <M-j> <C-T>
map <M-k> <C-]>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <F3> :set hlsearch!<CR>
map <C-F12> !:ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let g:easytags_dynamic_files = 2
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:python_highlight_all = 1

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

if has('gui_running')
    colorscheme default
else
    colorscheme desert
endif

au BufNewFile *.py 0r ~/.vim/python.skel
au BufNewFile *.h 0r ~/.vim/chead.skel
au BufNewFile *.cpp 0r ~/.vim/cprog.skel

runtime macros/matchit.vim

