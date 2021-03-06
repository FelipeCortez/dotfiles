syntax on
filetype plugin indent on

" Fix tmux clipboard
if $TMUX == ''
    set clipboard+=unnamed
endif

set encoding=utf-8
set showcmd
set relativenumber
set noswapfile
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Show dots on trailing whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Whitespace
set nowrap
set textwidth=79
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set omnifunc=syntaxcomplete#Complete

" Folding
set foldmethod=indent
set foldlevel=99

" zsh-like tab completion
set wildmenu
set wildmode=full

" Maps space to folds
nnoremap <Space> za
vnoremap <Space> za

" Maps leaderspace to nohlsearch
nnoremap <leader><space> :noh<cr>

" Maps leader t to tagbar
nmap <leader>t :TagbarOpenAutoClose<cr>

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
nmap <leader>w :call TrimWhiteSpace()<cr>

autocmd FileType scala setlocal shiftwidth=2 tabstop=2

" Reloads vimrc automatically
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | endif
augroup END

if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim/undo
endif
