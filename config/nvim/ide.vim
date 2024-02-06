if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=4
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%150v.\+/

" https://github.com/myusuf3/numbers.vim
nnoremap N :NumbersToggle<CR>

" Airline

" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

" Underline cursor line
hi clear CursorLine
hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None
