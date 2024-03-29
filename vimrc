set nocompatible
set undofile
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'psf/black'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin on
filetype plugin indent on


set ignorecase
set smartcase
set gdefault

set encoding=utf-8

" Split
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

"Enable folding with the spacebar
nnoremap <space> za


"Save fold
au BufWinLeave * mkview
au BufWinEnter * silent loadview


set t_Co=256

let python_highlight_all=1
set fileformat=unix
set ruler

set sts=4
set ts=4
set sw=4
set expandtab
set autoindent
syn on
colorscheme zenburn
"filetype indent on
set autoread

"Change leader key
let mapleader = ","
"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Replace all tabs with 4 whitespaces
nnoremap <leader>T :%s/\t/    /<CR>
nnoremap <leader>S :%s/\%u200b//<CR>
nnoremap <leader>F :%s/[\xa0]/ /<CR>

set pastetoggle=<F2>
"tnoremap <ESC> <C-w>:q!<CR>
nnoremap <leader>q :q<CR>
set backspace=indent,eol,start
"nnoremap <F3> :w<CR>:!clear;python %<CR>
nnoremap <F3> :w<CR>:vert term python %<CR>
nnoremap <F4> :w<CR>:!clear;black %<CR>
nnoremap <F5> :w<CR>:vert terminal ++close python -m ipdb %<CR>
"autocmd BufWinEnter *.py nmap <silent> <F5>:w<CR>:terminal python -m pdb %<CR>

syn keyword pythonStatement async await

"highlight search results (as you type)
set incsearch
set showmatch
set hlsearch
"clear out a search
nnoremap <leader><space> :noh<cr>
"reselect the text that was just pasted
nnoremap <leader>v V`]
"to exit back to normal mode
inoremap jj <ESC>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


au BufRead,BufNewFile *.py set filetype=python

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>



set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set statusline+=%f\ \ \ \ %l\:%v

set tabpagemax=30
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
