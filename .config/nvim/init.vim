" Settings {{{

set nocompatible              " be iMproved, required
syntax enable                 " enable syntax
set number relativenumber     " Set numbers on the left side
set spelllang=en_us,es_es     " Spell
set pastetoggle=<leader>p     " To paste text from outside vim and not indent everything wrong (Paste mode)
set noshowmode                " Hide modes if using lightline
set foldmethod=marker
"" Tabs
filetype indent on            " For 2 spaces on tabs
set expandtab                 " On pressing tab, insert 2 spaces
set tabstop=2                 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2              " when indenting with '>', use 2 spaces width

" }}}

" File Find {{{

set path+=**
set wildmenu
set wildignore+=**/.venv/**

" }}}

" Plugins {{{

filetype plugin on            " enable plugins
"" Install if ont installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " For completion
Plug 'ptzz/lf.vim'                                " For lf File Manager
Plug 'rbgrouleff/bclose.vim'                      " For lf File Manager
Plug 'scrooloose/nerdcommenter'                   " Commenter with Ctrl+P
Plug 'ryanoasis/vim-devicons'                     " Icons for NerdTree
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'vifm/vifm.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'hashivim/vim-terraform'
" Plug 'arcticicestudio/nord-vim'
call plug#end()

" }}}

" Mappings {{{

"" LF File Manager
let g:lf_map_keys = 0
map <SPACE> :Lf<CR>

"" Toggle comments normal and visual modes
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

"" changing splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" }}}

" Colors {{{

colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'buffers', 'readonly', 'modified' ] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
