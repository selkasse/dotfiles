syntax enable

filetype plugin indent on

set clipboard=unnamedplus

set mouse=a
           
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nowrap

set noswapfile
set hidden
set noerrorbells
set ignorecase
set relativenumber
set nu
set nohlsearch
set scrolloff=8
set signcolumn=yes


set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set colorcolumn=80

highlight ColorColumn ctermbg=80 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')

Plug 'ThePrimeagen/vim-be-good'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-unimpaired'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color schemes
Plug 'Rigellute/shades-of-purple.vim'
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme shades_of_purple

let g:coc_global_extensions = [
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-eslint',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ ]


command! -nargs=0 Prettier :CocCommand prettier.formatFile

" auto-indent function new line
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let mapleader = " " 

nnoremap <leader>ev :vsplit $MYVIMRC <CR>
nnoremap <leader>sv :source $MYVIMRC <CR>

nnoremap H 0
nnoremap L $

" vim-unimpaired config
nmap = [e
nmap - ]e

vmap = [egv
vmap - ]egv

" set - to move current line down
"nnoremap - :m+ <cr>==
" set = to move current line up
"nnoremap = :m-2 <cr>==


" vim-closetag config - copied from README
" (only using for React, may need to pare this down)
" (auto-closing tags with html works without this config)
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
            \ 'typescript.tsx': 'jsxRegion,tsxRegion',
            \ 'javascript.jsx': 'jsxRegion',
            \ }

let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'



" vim-airline-theme config
let g:airline_theme='onedark'
"let g:airline_theme='biogoo'
"let g:airline_theme='night_owl'
"let g:airline_theme='lighthaus'

