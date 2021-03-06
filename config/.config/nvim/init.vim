let mapleader = " " 

nnoremap <leader>ev :vsplit $MYVIMRC <CR>
nnoremap <leader>sv :source $MYVIMRC <CR>

" general config
if !exists("g:syntax_on")
    syntax enable
endif
filetype plugin indent on

set clipboard=unnamedplus

set conceallevel=3

set mouse=a

set cursorline

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nowrap

set noswapfile
"set hidden
set noerrorbells
set ignorecase
set relativenumber
set nu
set nohlsearch
set scrolloff=8
set signcolumn=yes

set undodir=~/.config/nvim/undodir
set undofile

set colorcolumn=80
highlight ColorColumn ctermbg=80 guibg=lightgrey

" plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'vimwiki/vimwiki'

Plug 'ThePrimeagen/vim-be-good'

Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'tpope/vim-unimpaired'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/calendar-vim'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" color schemes
Plug 'mhartington/oceanic-next'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'morhetz/gruvbox'
Plug 'pgavlin/pulumi.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()

set termguicolors
colorscheme nightfly

nnoremap <leader>C :Calendar <CR> :vertical resize +7 <CR>

nnoremap <leader>f :FZF <CR>

nnoremap H 0
nnoremap H 0

vnoremap L $
vnoremap L $

" coc config
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

" split config
set splitright
nnoremap <leader>v :vsplit <CR>

" switch between splits with <leader> h/j/k/l
nnoremap <leader>j <C-w><Down> <CR>
nnoremap <leader>k <C-w><Up> <CR>
nnoremap <leader>h <C-w><Left> <CR>
nnoremap <leader>l <C-w><Right> <CR>

" swap split positions
nnoremap <leader>S <C-w>k<C-w>x

" manually adjust split size (if no mouse support)
nnoremap <leader>r :vertical resize +5 <CR>
nnoremap <leader>R :vertical resize -5 <CR>

" vimwiki config
"nnoremap <leader>ww :vsplit ~/vimwiki/index.wiki <CR>

let g:vimwiki_folding = 'syntax'
let g:vimwiki_use_calendar= 1
let wiki = {}
let wiki.path = $HOME.'/notes'
let wiki.diary_rel_path = 'journal'
let wiki.diary_index = 'journal'
let wiki.diary_header = 'journal'
let wiki.index = 'index'
let g:vimwiki_list = [wiki]

hi VimwikiHeader1 guifg=#E58E0B
hi VimwikiHeader2 guifg=#7ADDC0
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00

" vim-unimpaired config
nmap = [e
nmap - ]e

vmap = [egv
vmap - ]egv

" vim-closetag config - copied from README
" NOTE: (only using for React, may need to pare this down)
" NOTE: (auto-closing tags with html works without this config)
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
" NOTE: commented-out to get rid of insert mode delay
"let g:closetag_close_shortcut = '<leader>>'

" vim-airline-theme config
let g:airline_powerline_fonts = 1

"let g:airline_theme='onedark'
"let g:airline_theme='badwolf'
"let g:airline_theme='gruvbox'

"let g:airline_theme='biogoo'
let g:airline_theme='night_owl'
"let g:airline_theme='lighthaus'
"let g:airline_theme='base16_ashes'

" vim-devicons config
set guifont=3270-Medium\ Nerd\ Font\ Complete\ 11
set encoding=UTF-8
if exists("g:loaded_webdevicons")
      call webdevicons#refresh()
endif

" open vimwiki external links
nnoremap <leader>u :call HandleURL()<CR>

function! HandleURL()
  " get the whole link, including the |Description
  let s:link = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  " split the link on | and discard the description
  let s:uri = split(s:link, "|")[0]
  
  echo s:uri

  if s:uri != ""
    " open uri in default browser (WSL)
    "silent exec "!cmd.exe /c start '".s:uri."'" .escape(s:uri, '%#!')
    silent exec "!cmd.exe /c start '".escape(s:uri, '%#!')."'" 
  else
    echo "No URI found in line."
  endif
endfunction

" automatically save and load folds
autocmd BufWinLeave $MYVIMRC mkview
autocmd BufWinEnter $MYVIMRC silent! loadview 

" NERDTree config
" start NERDTree when vim starts
autocmd VimEnter * NERDTree
autocmd FileType nerdtree setlocal nolist
nnoremap <leader>t :NERDTreeToggle <CR>

