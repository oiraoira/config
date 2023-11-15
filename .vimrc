set nocompatible
execute pathogen#infect('bundle/{}')

set nowrap
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=88
set number
set relativenumber
if has("gui_running")
    set lines=65
    set columns=89
endif
set matchtime=20
set tags=./tags
set autoindent
set backspace=2
set t_BE=
filetype on
filetype indent on
set guifont=Monospace\ 8
syntax on
map <M-j> <C-T>
map <M-k> <C-]>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <F3> :set hlsearch!<CR>
map <C-F12> !:ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F7> :setlocal spell! spelllang=en_gb<CR>

let g:easytags_dynamic_files = 2
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:python_highlight_all = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'luna'
let g:ariline_powerline_fonts = 1

"if has('gui_running')
"    colorscheme default
"else
"    colorscheme slate
"endif

if &diff
    colorscheme evening
endif

au BufNewFile *.py 0r ~/.vim/python.skel
au BufNewFile *.h 0r ~/.vim/chead.skel
au BufNewFile *.cpp 0r ~/.vim/cprog.skel

autocmd FileType cpp,c,make,automake set noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType xml,html setlocal ts=2 sts=2 sw=2 expandtab

runtime macros/matchit.vim

