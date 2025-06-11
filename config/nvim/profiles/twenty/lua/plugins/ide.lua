vim.cmd([[
  if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=4
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
]])

vim.cmd("highlight OverLength ctermbg=red ctermfg=white guibg=#592929")

-- https://github.com/myusuf3/numbers.vim
vim.cmd("nnoremap N :NumbersToggle<CR>")

vim.cmd([[
  match OverLength /\%150v.\+/")
]])

-- unbind Shift + D (used to split terminal pane)
vim.cmd("map <S-d> <Nop>")

return {}
-- Underline cursor line
-- hi clear CursorLine
-- vim.cmd("hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None")
