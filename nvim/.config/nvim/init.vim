" Global Settings
set relativenumber number
set smartcase
set undofile
set clipboard=unnamedplus
set mouse=a
set incsearch
set scrolloff=10
set updatetime=100
set wildmode=longest,list,full
syntax on
set nocompatible
filetype plugin on
set splitbelow splitright
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
let mapleader=" "
let leader=" "

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Autocommands
autocmd BufWritePre * %s/\s\+$//e

" Install plugins with vim-plug
call plug#begin(stdpath('data') . '/plugged')

" Eye-candy
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'APZelos/blamer.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" Completions
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'

" Usablility
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'preservim/nerdtree'
Plug 'simnalamburt/vim-mundo' " To install support, run: pip3 install --user pynvim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

" Moving lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Insert tabs
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Mundo
nnoremap <leader>u :MundoToggle<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>1 :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Theme
set termguicolors
let g:nord_italic = 1
let g:nord_underline = 1
colorscheme nord

" Git Blamer
let g:blamer_enabled = 1

" fzf
silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
  noremap <C-p> :GFiles --cached --others --exclude-standard<CR>
else
  noremap <C-p> :Files<CR>
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" QuickScope
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Use <TAB> and <S-TAB> to jump over false-matches while searching
" https://www.reddit.com/r/vim/comments/hyxo4u/usefulness_of_ctrlg_and_ctrlt_while_searching/fzie77u?utm_source=share&utm_medium=web2x&context=3
set wildcharm=<C-z>
cnoremap <expr> <Tab>   getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>"

