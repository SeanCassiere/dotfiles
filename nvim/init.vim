" Place this file in ./config/nvim/init.vim

set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set autoindent
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set wildmenu
set spell
set lazyredraw
set smarttab
set ai
set si

syntax on
filetype plugin indent on
set ttyfast

set shell=fish
set cc=120
set encoding=UTF-8
set cursorline
set nocompatible

call plug#begin()

Plug 'morhetz/gruvbox' " Gruvbox Theme
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar themes
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Vim themes
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/nerdtree' " NerdTree

call plug#end()

:colorscheme space-vim-dark

set guifont=:MesloLGMRegularNerdFontComplete:h12
let g:airline_powerline_fonts = 1

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
