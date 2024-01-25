set nocompatible

set noerrorbells

filetype plugin indent on

syntax on

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

set updatetime=100

set ruler
set number
set mouse=a
set mousehide

set showmatch
set nowrap
set autoindent
set cursorline

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" set exrc

" set guicursor=
" set relativenumber
" set hidden
set scrolloff=20
set noshowmode
set cmdheight=2
" set noswapfile
" set incsearch

" set number relativenumber
set nu rnu

" Highlight matching search patterns
set hlsearch
" set nohlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
" set ignorecase
" Include only uppercase words with uppercase search term
" set smartcase


" Store info from no more than 200 files at a time, 9999 lines of text, 999kb
" of data.
set viminfo='200,<9999,s999

" Increase undo history
set history=333

" Support strikethrough
" https://stackoverflow.com/a/69682894
if &term =~ 'xterm\|kitty\|alacritty\|tmux'
    let &t_Ts = "\e[9m"   " Strikethrough
    let &t_Te = "\e[29m"
    let &t_Cs = "\e[4:3m" " Undercurl
    let &t_Ce = "\e[4:0m"
endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.config/nvim/conf/plugins.vimrc
source $HOME/.config/nvim/conf/markdown.vimrc
source $HOME/.config/nvim/conf/colors.vimrc
source $HOME/.config/nvim/conf/ide.vimrc
source $HOME/.config/nvim/conf/javascript.vimrc
