" ?? Not sure where this came from
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

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


" CODE FOLDING

" https://vimtricks.com/p/vim-code-folding/
" https://www.vimfromscratch.com/articles/vim-folding

set foldmethod=indent
set nofoldenable

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview"

" vim-gitgutter
" https://github.com/airblade/vim-gitgutter
hi SignColumn ctermbg=Black
hi GitGutterAdd ctermbg=Black
hi GitGutterChange ctermbg=Black
hi GitGutterDelete ctermbg=Black
