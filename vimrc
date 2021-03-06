set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins Start
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'w0rp/ale'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'

" python
Plug 'nvie/vim-flake8'
Plug 'hdima/python-syntax'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" other
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'scrooloose/nerdcommenter'
Plug 'wincent/command-t'
Plug 'pearofducks/ansible-vim'
Plug 'ryanoasis/vim-devicons'


" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" All of your Plugins must be added before the following line
call plug#end()            " required

syntax enable

augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Search ctermbg=3
  autocmd ColorScheme nord highlight Visual ctermfg=1
augroup END

colorscheme nord

let g:airline_theme='nord'
let g:airline#extensions#ale#enabled = 1
let g:vim_json_syntax_conceal = 0
let b:ale_linters = ['eslint']

" VirtualEnv NeoVim Setup
let g:python_host_prog = '/Users/mrbook2/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/mrbook2/.pyenv/versions/neovim3/bin/python'

let &colorcolumn=join(range(101,102),",")
highlight ColorColumn ctermbg=235 guibg=#93a1a1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set nu
set nowrap
set noshowmode
set pastetoggle=<F2>
let mapleader = ","

set rtp+=/usr/local/opt/fzf

nnoremap <leader>s :split<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

map <leader>cc :NERDComComment
nmap <leader>t :Files<cr>


let g:ale_fixers = {
\   'python': ['yapf', 'isort', 'autopep8'],
\   'javascript': ['eslint']
\}

let g:ale_linters = {
\   'python': ['flake8', 'pyls', 'mypy'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'scss': ['stylelint']
\}
