" Set numbers on the left side
set number relativenumber


" For 2 spaces on tabs
filetype indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Enable syntax and plugins
syntax enable
filetype plugin on



" To paste text from outside vim and not indent everything wrong (Paste mode)
set pastetoggle=<Ctrl+F4>



"Hide modes if using lightline
set noshowmode


" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'arcticicestudio/nord-vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'arcticicestudio/nord-vim'
call plug#end()

" Vifm
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>



" Colors
colorscheme nord
" colorscheme dracula
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }
