" colorscheme desert
" colorscheme nightfly

hi ErrorMsg cterm=bold guifg=Black guibg=Red
hi Search ctermbg=28 ctermfg=white
hi DiffDelete ctermfg=88 cterm=strikethrough gui=strikethrough

hi NvimInternalError cterm=underline gui=underline ctermfg=red guifg=red ctermbg=white guibg=white

" make background transparent ?
hi Normal ctermbg=NONE
hi EndOfBuffer ctermbg=NONE
hi LineNr ctermbg=234

hi link ALEError ErrorMsg
hi link ALEStyleError ErrorMsg
hi link ALEStyleWarning ErrorMsg
hi link ALEWarning ErrorMsg
