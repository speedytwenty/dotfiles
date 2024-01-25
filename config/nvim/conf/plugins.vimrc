if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" NVIM Util
" Plug 'famiu/nvim-reload' " :Reload

" MARKDOWN
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" IDE

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" vim-rhubarb (depends on vim-fugitive)
" Enables :GBrowse from fugitive.vim to open GitHub URLs.
Plug 'tpope/vim-rhubarb' 

" numbers.vim is a plugin for intelligently toggling line numbers.
" SHIFT+N to toggle.
Plug 'myusuf3/numbers.vim'

" The cool status bar at the bottom of the IDE.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" JAVASCRIPT
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" https://medium.com/@jimeno0/eslint-and-prettier-in-vim-neovim-7e45f85cf8f9
Plug 'w0rp/ale'

" Indentation
Plug 'gavocanov/vim-js-indent'

" Syntax
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern'  }

" Completion
" Plug '1995eaton/vim-better-javascript-completion'

" NODE.JS

" Plug 'othree/es.next.syntax.vim'

" Node Dictionary: https://github.com/guileen/vim-node-dict
" Seems to require setup. Not clear what it provides with the dictionary.
" Plug 'guileen/vim-node-dict'

" Snippets: https://github.com/isRuslan/vim-es6
" Plug 'isRuslan/vim-es6'
"
" Shortcuts: https://github.com/moll/vim-node
" Plug 'moll/vim-node'

" PHP
Plug '2072/PHP-Indenting-for-VIm', { 'for': ['php'] }
Plug 'Rican7/php-doc-modded', { 'for': ['php'] }
Plug 'shawncplus/phpcomplete.vim', { 'for': ['php'] }
Plug 'paulyg/Vim-PHP-Stuff', { 'for': ['php'] }
Plug 'shawncplus/php.vim', { 'for': ['php'] }

" Worthwhile shortcuts
" https://github.com/tpope/vim-commentary
" gcc - comment out a line (takes a count)
" gc - comment out the target of a motion (gcap to comment out a paragraph)
" :7,15/Commentary - Command
" :g/console/Commentary
Plug 'tpope/vim-commentary'

" Color scheme(s)
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()
